<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

//=====================================================================================================
//  Look for offsetting trades in open_trades table and close out matched trades
//      (1) select from open trades - match symbols and opposing buy_sell
//      (2) take the lower qty of the pair, create a new record in offset_trade table
//      (3) update open_trade table - by setting the higher qty = higher qty - offset_qty
//      (4) delete from open_trade table - by removing the trade with lower qty
//      (5) if both trades have identical qty - remove both records
//      (6) update account balance with realizedpl
//=====================================================================================================
//$accountId = $_GET["account_id"];
$accountId = 2;

//=====================================================================================================
// step 1: check open_trade table - there should be at least TWO open trades for this account
//=====================================================================================================
$query = "SELECT * FROM `open_trade` WHERE `account_id` = $accountId )";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) === 0 || mysqli_num_rows($queryResult) === 2){
    throw new Exception('this user has 0 or 1 open trade, nothing to offset');
}

//=====================================================================================================
// step 2: get the most recent open trade for this account
//=====================================================================================================
$query = "SELECT `id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty` 
FROM `open_trade` WHERE `id` = ( SELECT MAX(id) AS id FROM `open_trade` WHERE `account_id` = $accountId ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);
$buy_sell = $row["buy_sell"];
if ($buy_sell = 'B') {
    $lookForBuySell = 'S';
    $buyPrice = $row["trade_price"];
    $buyTradeId = $row["orig_trade_id"];
} else {
    $lookForBuySell = 'B';
    $sellPrice = $row["trade_price"];
    $sellTradeId = $row["orig_trade_id"];
}
$newTradeSymbol = $row["symbol"];
$newTradeDateTime = $row["orig_trade_date"];
$newTradeBuySell = $row["buy_sell"];
$newTradeOpenQty = $row["open_qty"];

//=====================================================================================================
// step 3: look for another open trade with same symbol in opposite buy_sell direction
//=====================================================================================================
$query = "SELECT `id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty` 
FROM `open_trade` WHERE `account_id` = $accountId AND `symbol` = $newTradeSymbol AND `buy_sell` = $lookForBuySell ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) === 0){
    throw new Exception('there is nothing to offset');
}

//======================================================================================================================
// step 4: for each open trade in opposite direction, do the following: (insert, delete, update)
//  (1) Compare open_qty for the two pairs of trades - take the minimum of the two qty as the offset_qty
//  (2) Insert offset_trades table - new offset trade offset_qty = the minimum qty of the pair
//  (3) Delete from open_trades table - the record with offset_qty (close out this open trade, it is no longer open)
//  (4) Update open_trades table - for the remaining open trade - Set open_qty = open_qty - offset_qty
//======================================================================================================================
while($row = mysqli_fetch_assoc($queryResult)) {
    $foundOpenTradeQty = $row["open_qty"];
    $foundOpenTradePrice = $row["trade_price"];
    if ($lookForBuySell = 'B')
    $offset_qty = min($newTradeOpenQty, $foundOpenTradeQty);
    $realizedpl = $foundOpenTradePrice
    $timestamp = new DateTime();

    $query = "INSERT INTO `offset_trade` (`account_id`, `settlement_date`, `buy_id`, `sell_id`, `symbol`, `offset_qty`, `realized_pl`) 
VALUES ($accountId, $timestamp, $symbol, $offset_qty, $realizedpl )";


}

//insert into open_trade (account_id, orig_trade_id, orig_trade_date, symbol, buy_sell, trade_price, open_qty)
$query = "INSERT INTO `open_trade` (`account_id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty`) 
VALUES ($accountId, $newTradeId, $newTradeDateTime, $symbol, $buy_sell, $price, $shares)";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}


?>