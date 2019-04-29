<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

$accountId = $_GET["account_id"];
$symbol = $_GET["symbol"];  //'AAPL'
$buy_sell = $_GET["buy_sell"]; //'B'
$shares = (int)$_GET["shares"]; //80
$price = $_GET["price"]; //203

$output = [
    'success' => false,
    'message' => ''
];

$price_range = 0.5;
if($buy_sell === 'B'){
    $amountRequired = -1 * $price * $shares;
} else {
    $amountRequired = $price * $shares;
}


//========================================================================================================
//  Step 1: validate input data: tick symbol needs to exist in company table before you can trade
//========================================================================================================
$query = "SELECT `symbol` FROM `company` WHERE `symbol` = '$symbol' ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) === 0){
    throw new Exception('Stock symbol does not exist in company table - must add symbol before trading.');
}

// validate Shares must be > 0, Price must be > 0
if ($shares <= 0 || $price <= 0){
    throw new Exception('Share and/or price must be greater than 0.');
}

//=====================================================================================================
//  Step 2: check if trade price entered is within reasonable range (5%) of last market price
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
if ($currPrice != 0 && $currPrice != null) {
    if ($price < $currPrice * (1-$price_range) or $price > $currPrice * (1+$price_range)) {
        throw new Exception('Price out of range, must be within last market price +/- '.$price_range.'.');
    }
}

//========================================================================================================
//  Step 3: If this transaction is a SELL - validate if there are existing BUY shares
//      If transaction is a BUY - check available account balance, abort if insufficient fund
//========================================================================================================
// if this transaction is a SELL - verify that there are equal BUY open trades in the open_trades table
if ($buy_sell === 'S') {
    $query = "SELECT `symbol`, sum(`open_qty`) as `total_buy_shares` FROM `open_trades` WHERE `account_id` = $accountId 
      AND `symbol` = '$symbol' AND `buy_sell` = 'B' GROUP BY `symbol` ";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult) {
        throw new Exception(mysqli_error($conn));
    }
    if (mysqli_num_rows($queryResult) === 0) {
        throw new Exception("You cannot sell stocks that you don't have.");
    }
    $row = mysqli_fetch_assoc($queryResult);
    $numBuyShares = $row["total_buy_shares"];
    if ($shares > $numBuyShares) {
        $output['message'] = 'You don\'t have enough shares in your portfolio to sell.';
        print(json_encode($output));
    }
// this is a BUY transaction - verify there is enough money in the account to make trade
} else {
    $query = "SELECT `avail_to_trade` FROM `account` WHERE `account_id` = $accountId";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult){
        throw new Exception(mysqli_error($conn));
    }
    $row = mysqli_fetch_assoc($queryResult);
    $availableToTrade = $row["avail_to_trade"];
    if ($availableToTrade < abs($amountRequired)){
        $output['message'] = 'You do not have enough available balance to make this trade.';
        print(json_encode($output));
    }
}

//=====================================================================================================
//  Step 4: insert new trade in transaction table
//=====================================================================================================
$timestamp = date_create('now')->format('Y-m-d H:i:s');
$query = "INSERT INTO `transaction` (`account_id`, `trade_date`, `symbol`, `buy_sell`, `trade_price`, `quantity`, `status`, `amount`) 
VALUES ($accountId, '$timestamp', '$symbol', '$buy_sell', $price, $shares, 'Open', $amountRequired)";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
//  Step 5: insert new trade in open trade table - this is a two step process
//      (1) need to get the newly created trade transaction id and timestamp from transaction table
//      (2) create a new record in open_trades table
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

//insert into open_trades (account_id, orig_trade_id, orig_trade_date, symbol, buy_sell, trade_price, open_qty)
$query = "INSERT INTO `open_trades` (`account_id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty`) 
VALUES ($accountId, $newTradeId, '$newTradeDateTime', '$symbol', '$buy_sell', $price, $shares)";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
// step 6: update account balance to account for a BUY trade
//=====================================================================================================
if ($buy_sell === 'B') {
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

    $totalAsset = $totalAsset + $amountRequired;
    $availBalance = $availBalance + $amountRequired;
    $availToTrade = $availToTrade + $amountRequired;

    $query = "UPDATE `account` SET `total_asset` = $totalAsset, 
      `avail_balance` = $availBalance, `avail_to_trade` = $availToTrade 
      WHERE `account_id` = $accountId ";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult) {
        throw new Exception(mysqli_error($conn));
    }
}
//=====================================================================================================
//  Step 7: This is a SELL transaction - look for open BUY trades to offset
//=====================================================================================================
else {
        include_once('offsettrades.php');
     }

$output['success'] = true;
$output['message'] = 'Trade was successfully added.';

print(json_encode($output));

?>