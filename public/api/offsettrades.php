<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

//=====================================================================================================
// Trade Offset: Find pairs of trades that can be offset and/or close out
// (1) Get the most recently added trade from open_trades table (assuming each time a new trade
//      is entered in the transaction table, an identical trade is added in the open_trades table
// (2) For the newly added trade (newTrade - Id, Date, Symbol, BuySell, Qty, Price)
//      Find opposite-direction open trades - match on symbol and opposite direction of BuySell
//       ***  sort trades in DESC order - offset trades in LAST IN FIRST OUT order
//      LOOP through each opposite-direction open trade: (oldTrade - Id, Date, Symbol, BuySell, Qty, Price)
// (3) Determine offset qty - MIN(newTradeQty, oldTradeQty)
//      - Calculate Realized PL = ($newPrice - $oldTradePrice) * $offset_qty;
//      - INSERT a new record in the offset_trades table
//      -  `settlement_date`, `buy_id`, `sell_id`, `symbol`, `offset_qty`, `realized_pl`
// (4) Does this completely close out the new trade?
//      Yes - DELETE new trade from open_trades table
//          - Check if the old trade should be updated or be closed out
//            Does this completely close out the old trade? (oldTradeQty=offsetQty)
//              Yes - DELETE old trade from open_trades table
//               No - UPDATE old trade open_qty=oldTradeQty-offsetQty
//    ***   - EXIT LOOP (no more new trade qty to offset)
//       No - UPDATE new trade open_qty=newTradeQty-offsetQty in open_trades table
//          - Check if the old trade should be updated or be closed out
//            Does this completely close out the old trade? (oldTradeQty=offsetQty)
//              Yes - DELETE old trade from open_trades table
//               No - UPDATE old trade open_qty=oldTradeQty-offsetQty
//    ***   - CONTINUE the LOOP to check for next offset
// (5) UPDATE account balances - with realized PL
//=====================================================================================================
//$accountId = $_GET["account_id"];
$accountId = 2;
$realized_pl = 0;       // set default to 0, in case there are no trades to offset
$total_realized_pl = 0; // need to track p/l for all offset trades

//=====================================================================================================
// step 1: check open_trades table - does this account have at least TWO open trades to offset?
//=====================================================================================================
$query = "SELECT * FROM `open_trades` WHERE `account_id` = $accountId ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) < 2){
    throw new Exception('nothing to offset');
}
//=====================================================================================================
// step 2: get the most recent open trade for this account using MAX (trade_id) (i.e. the new trade)
//=====================================================================================================
$query = "SELECT `id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty` 
FROM `open_trades` WHERE `id` = ( SELECT MAX(id) FROM `open_trades` WHERE `account_id` = $accountId )";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

$row = mysqli_fetch_assoc($queryResult);
$symbol = $row["symbol"];
$newTradeId = $row["orig_trade_id"];
$newTradeBuySell = $row["buy_sell"];
$newTradePrice = $row["trade_price"];
$newTradeOpenQty = $row["open_qty"];
if ($newTradeBuySell === 'B') {
    $buyTradeId = $newTradeId;
    $oldTradeBuySell = 'S';
} else {
    $sellTradeId = $newTradeId;
    $oldTradeBuySell = 'B';
}

//=====================================================================================================
// step 3: look for trades in open_trades table with same symbol in opposite buy_sell direction
//   sort in DESC order - offset trades in LAST IN FIRST OUT
//=====================================================================================================
$queryOldTrade = "SELECT `id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty` 
FROM `open_trades` WHERE `account_id` = $accountId AND `symbol` = '$symbol' AND `buy_sell` = '$oldTradeBuySell'
ORDER BY `orig_trade_date` DESC ";
$queryOldTradeResult = mysqli_query($conn, $queryOldTrade);
if (!$queryOldTradeResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryOldTradeResult) === 0){
    throw new Exception('no open trade to offset');
}

//======================================================================================================================
// step 4: for each open trade in opposite direction, do the following:
//  (1) Pair up the two opposite trades - take the minimum qty of the two trades as the offset_qty
//  (2) Insert offset_trades table - offset_qty = the minimum qty of the pair, calculate realized PL
//  (3) Check if the new trade is completely offset
//      - if yes, close out the new trade (but check on the old trade offset status first)
//      - if not, update qty and continue the loop
//  (4) Check if the old trade is completely offset - yes - remove old trade, no - update open_qty
//======================================================================================================================
while($newTradeOpenQty > 0) {

    // for each old trade that can be offset with the new trade
    $row = mysqli_fetch_assoc($queryOldTradeResult);
    $oldTradeId = $row["orig_trade_id"];
    $oldTradePrice = $row["trade_price"];
    $oldTradeOpenQty = $row["open_qty"];
    if ($oldTradeBuySell === 'B') {
        $buyTradeId = $oldTradeId;
    } else {
        $sellTradeId = $oldTradeId;
    }

    $offset_qty = min($newTradeOpenQty, $oldTradeOpenQty);
    $realized_pl = ($newTradePrice - $oldTradePrice) * $offset_qty;

    // insert a new record in offset_trade table
    $timestamp = date_create('now')->format('Y-m-d H:i:s');
    $query = "INSERT INTO `offset_trades` (`account_id`, `settlement_date`, `buy_id`, `sell_id`, `symbol`, `offset_qty`, `realized_pl`) 
      VALUES ($accountId, '$timestamp', $buyTradeId, $sellTradeId, '$symbol', $offset_qty, $realized_pl )";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult){
        throw new Exception(mysqli_error($conn));
    }

    // update open trade qty for both new and old trade
    $newTradeOpenQty = $newTradeOpenQty - $offset_qty;
    $oldTradeOpenQty = $oldTradeOpenQty - $offset_qty;

    // check if the new trade is completely offset? if yes, exit the loop, no need to check for any more offset
    if ($newTradeOpenQty === 0) {
        // delete the new trade from open_trades table
        $query = "DELETE FROM `open_trades` WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
          AND `orig_trade_id` = $newTradeId ";
        $queryResult = mysqli_query($conn, $query);
        if (!$queryResult){
            throw new Exception(mysqli_error($conn));
        }
        // update trade status in transaction table
        $query = "UPDATE `transaction` SET `status` = 'Closed' 
            WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
              AND `id` = $newTradeId ";
        $queryResult = mysqli_query($conn, $query);
        if (!$queryResult){
            throw new Exception(mysqli_error($conn));
        }
        // check if the old trade is completely or partially offset?
        // completely offset - delete from open_trades, update status in transaction to Closed
        if ($oldTradeOpenQty === 0) {

            //================================================================================
            // if old trade is completely offset - remove from open_trades and update status
            //================================================================================
            $query = "DELETE FROM `open_trades` WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
            AND `orig_trade_id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }
            // update trade status in transaction table for the old trade
            $query = "UPDATE `transaction` SET `status` = 'Closed' 
            WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
              AND `id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }

        } else {

            //================================================================================
            // old trade is partially offset - update open_trade qty and status
            //================================================================================
            $query = "UPDATE `open_trades` SET `open_qty` = $oldTradeOpenQty 
            WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
              AND `orig_trade_id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }
            $query = "UPDATE `transaction` SET `status` = 'Offset' 
            WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
              AND `id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }
        }
        // no more offset to check, exit the while loop

    } else {
        // update the new trade's open qty in open_trades table
        $query = "UPDATE `open_trades` SET open_qty = $newTradeOpenQty
           WHERE `account_id` = $accountId AND `orig_trade_id` = $newTradeId ";
        $queryResult = mysqli_query($conn, $query);
        if (!$queryResult){
            throw new Exception(mysqli_error($conn));
        }
        // update new trade status in transaction table
        $query = "UPDATE `transaction` SET `status` = 'Offset' 
            WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
              AND `id` = $newTradeId ";
        $queryResult = mysqli_query($conn, $query);
        if (!$queryResult){
            throw new Exception(mysqli_error($conn));
        }
        //================================================================================
        // if old trade is completely offset - remove from open_trades and update status
        //================================================================================
        if ($oldTradeOpenQty === 0) {
            $query = "DELETE FROM `open_trades` WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
          AND `orig_trade_id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }
            // update trade status in transaction table for the old trade
            $query = "UPDATE `transaction` SET `status` = 'Closed' 
            WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
              AND `id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }

        } else {
            //================================================================================
            // old trade is partially offset - update open_trade qty and status
            //================================================================================
            $query = "UPDATE `open_trades` SET `open_qty` = $oldTradeOpenQty 
             WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
             AND `orig_trade_id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }
            $query = "UPDATE `transaction` SET `status` = 'Offset' 
            WHERE `account_id` = $accountId AND `symbol` = '$symbol' 
              AND `id` = $oldTradeId ";
            $queryResult = mysqli_query($conn, $query);
            if (!$queryResult){
                throw new Exception(mysqli_error($conn));
            }

        }

    }
//==========================================================================
// if there are multiple offsets - need to accumulate all realized PL
//==========================================================================
    $total_realized_pl = $total_realized_pl + $realized_pl;
}

//=====================================================================================================
// step 5: account balance needs to be updated for all offset trades
//=====================================================================================================
if ($total_realized_pl !== 0) {
    $query = "SELECT `total_asset`, `avail_balance`, `avail_to_trade` FROM `account` 
      WHERE `account_id` = $accountId ";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult) {
        throw new Exception(mysqli_error($conn));
    }
    $row = mysqli_fetch_assoc($queryResult);
    $totalAsset = $row["total_asset"];
    $availBalance = $row["avail_balance"];
    $availToTrade = $row["avail_to_trade"];

    $totalAsset = $totalAsset + $total_realized_pl;
    $availBalance = $availBalance + $total_realized_pl;
    $availToTrade = $availToTrade + $total_realized_pl;

    $query = "UPDATE `account` SET `total_asset` = $totalAsset, 
      `avail_balance` = $availBalance, `avail_to_trade` = $availToTrade 
      WHERE `account_id` = $accountId ";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult) {
        throw new Exception(mysqli_error($conn));
    }

}

?>