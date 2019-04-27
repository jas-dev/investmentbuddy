<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

//$accountId = $_GET["account_id"];
$accountId = 2;
$symbol = $_GET["symbol"];  //'AAPL'
$buy_sell = $_GET["buy_sell"]; //'B'
$shares = (int)$_GET["shares"]; //80
$price = $_GET["price"]; //203
$amountRequired = $price * $shares;

//========================================================================================================
//  Step 1: check available account balance - is it enough to cover the current trade amount - no, abort
//========================================================================================================
$query = "SELECT `avail_to_trade` FROM `account` WHERE `account_id` = $accountId";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);
$availableToTrade = $row["avail_to_trade"];
if ($availableToTrade < $amountRequired){
    echo ("You do not have enough available balance to make this trade");
    exit;
}

//=====================================================================================================
//  Step 2: check if trade price is within reasonable range (5%) of last market price
//=====================================================================================================
$query = "SELECT `price` FROM `stock` WHERE `symbol` = '$symbol' 
AND `datetime` in (SELECT MAX(`datetime`) FROM `stock` GROUP BY `symbol`) ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);
$currPrice = $row["price"];
//if current price is null or 0, skip this check, user can buy whatever price they entered
if ($currPrice !== 0 && $currPrice !== null) {
    if ($price < $currPrice*.95 or $price > $currPrice*1.05) {
        echo ("Price is out of the market price range - unable to execute this trade");
        exit;
    }
}

//=====================================================================================================
//  Step 3: insert new trade in transaction table
//=====================================================================================================
//date_create('now')->format('Y-m-d H:i:s')
$timestamp = date_create('now')->format('Y-m-d H:i:s');
$query = "INSERT INTO `transaction` (`account_id`, `trade_date`, `symbol`, `buy_sell`, `trade_price`, `quantity`, `status`, `amount`) 
VALUES ($accountId, '$timestamp', '$symbol', '$buy_sell', $price, $shares, 'Open', $amountRequired)";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
//  Step 4: insert new trade in open trade table - this is a two step process
//      (1) need to get the newly created trade transaction id and timestamp from transaction table
//      (2) create a new record in open_trade table
//=====================================================================================================
$query = "SELECT `id`, `trade_date`, `account_id`, `symbol` FROM `transaction` WHERE `id` =
    ( SELECT MAX(id) FROM `transaction` WHERE `account_id` = $accountId AND `symbol` = '$symbol' ) ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);
$newTradeId = $row["id"];
$newTradeDateTime = $row["trade_date"];

//insert into open_trade (account_id, orig_trade_id, orig_trade_date, symbol, buy_sell, trade_price, open_qty)
$query = "INSERT INTO `open_trades` (`account_id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty`) 
VALUES ($accountId, $newTradeId, '$newTradeDateTime', '$symbol', '$buy_sell', $price, $shares)";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
//  Step 5: Look for open trades that can be offset with this new transaction
//=====================================================================================================

// offsettrades.php

?>