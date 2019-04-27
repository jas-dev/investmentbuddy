<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

//=====================================================================================================
//  Look for offsetting trades in open_trades table and close out matched trades
//      (1) select from open trades - match symbols and opposing buy_sell
//      (2) take the lower qty of the pair to offset the trade & create new record in offset_trade table
//      (3) update open_trade table - by updating the remaining trade qty after offset
//      (4) delete from open_trade table - by removing the trade with lower qty
//           if both trades have identical qty - remove both records, otherwise, delete only one trade
//      (5) update account balance with realizedpl
//=====================================================================================================
$accountId = $_GET["account_id"];
//$accountId = 2;

//=====================================================================================================
// step 1: check open_trades table - does this account have at least TWO open trades?
//=====================================================================================================
$query = "SELECT * FROM `open_trade` WHERE `account_id` = $accountId ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) < 2){
    throw new Exception('nothing to offset');
}

//=====================================================================================================
// step 2: get the most recent open trade for this account - based on MAX trade_id (i.e. the new trade)
//=====================================================================================================
$query = "SELECT `id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty` 
FROM `open_trade` WHERE `id` = ( SELECT MAX(id) FROM `open_trade` WHERE `account_id` = $accountId )";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);
$newBuySell = $row["buy_sell"];
if ($newBuySell = 'B') {
    $oldBuySell = 'S';
    $buyTradeId = $row["orig_trade_id"];
} else {
    $oldBuySell = 'B';
    $sellTradeId = $row["orig_trade_id"];
}
$symbol = $row["symbol"];
$newPrice = $row["trade_price"];
$newQty = $row["open_qty"];
$newTradeId = $row["orig_trade_id"];


//=====================================================================================================
// step 3: look for another open trade with same symbol in opposite buy_sell direction
//=====================================================================================================
$query = "SELECT `id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty` 
FROM `open_trade` WHERE `account_id` = $accountId AND `symbol` = '$symbol' AND `buy_sell` = '$oldBuySell' ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) === 0){
    throw new Exception('there is nothing to offset');
}

//======================================================================================================================
// step 4: for each open trade in opposite direction, do the following: (insert, delete, update)
//  (1) Pair up the two opposite trades - take the minimum qty of the two trades as the offset_qty
//  (2) Insert offset_trades table - new offset trade offset_qty = the minimum qty of the pair
//  (3) Delete from open_trades table - the record with offset_qty (close out this open trade, it is no longer open)
//  (4) Update open_trades table - for the remaining open trade - Set open_qty = open_qty - offset_qty
//======================================================================================================================
while($row = mysqli_fetch_assoc($queryResult)) {

    if ($oldBuySell === 'B') {
        $buyTradeId = $row["orig_trade_id"];
    } else {
        $sellTradeId = $row["orig_trade_id"];
    }
    $oldOpenTradeQty = $row["open_qty"];
    $oldOpenTradePrice = $row["trade_price"];
    $offset_qty = min($newQty, $oldOpenTradeQty);
    $realizedpl = ($newPrice - $oldOpenTradePrice) * $offset_qty;
    $newOpenTradeQty = $oldOpenTradeQty - $offset_qty;
    $timestamp = date_create('now')->format('Y-m-d H:i:s');
    // insert a new record in offset_trade table
    $query = "INSERT INTO `offset_trade` (`account_id`, `settlement_date`, `buy_id`, `sell_id`, `symbol`, `offset_qty`, `realized_pl`) 
      VALUES ($accountId, '$timestamp', $buyTradeId, $sellTradeId, '$symbol', $offset_qty, $realizedpl )";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult){
        throw new Exception(mysqli_error($conn));
    }
    // check if this will close out the old trade completely?
    if ($newOpenTradeQty === 0) {
        // delete BOTH open trade records that completely offset each other
        $query = "DELETE FROM `open_trades` WHERE `account_id` = $accountId AND `symbol` = '$symbol' AND `orig_trade_id` IN ($buyTradeId,$sellTradeId) ";
        $queryResult = mysqli_query($conn, $query);
        if (!$queryResult){
            throw new Exception(mysqli_error($conn));
        }
    } else {
        // update the open trade qty in open_trades table for the remaining open qty
        $query = "UPDATE `open_trades` SET open_qty = $newOpenTradeQty
           WHERE `account_id` = $accountId AND `orig_trade_id` = $old, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty`) 
           VALUES ($accountId, $newTradeId, $newTradeDateTime, $symbol, $buy_sell, $price, $shares)";
        $queryResult = mysqli_query($conn, $query);
        if (!$queryResult){
            throw new Exception(mysqli_error($conn));
        }
        // delete the obsolete open trade record that has been offset and closed out
        $query = "DELETE FROM `open_trades` WHERE `account_id` = $accountId AND `symbol` = '$symbol' AND `orig_trade_id` IN ($buyTradeId,$sellTradeId) ";
        $queryResult = mysqli_query($conn, $query);
        if (!$queryResult){
            throw new Exception(mysqli_error($conn));
        }

    }
}

//=====================================================================================================
// step 5: update account balance
//=====================================================================================================
$query = "SELECT `total_asset`, `avail_balance`, `avail_to_trade` FROM `account` WHERE `account_id` = $accountId ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$totalAsset = $row["total_asset"] + $realizedpl;
$availBalance = $row["avail_balance"] + $realizedpl;
$availToTrade = $row["avail_to_trade"] + $realizedpl;

$query = "UPDATE `account` SET `total_asset` = $totalAsset, `avail_balance` = $availBalance, `avail_to_trade` = $availToTrade 
WHERE `account_id` = $accountId ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

?>