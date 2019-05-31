<?php

require_once('functions.php');
set_exception_handler("handleError");
require_once('config.php');
require_once('mysqlconnect.php');


//======================================================================================================================
// Get account id from $_SESSION
//======================================================================================================================
if(empty($_SESSION['user_data']['id'])){
    throw new Exception('Missing account id');
}
$account_id = $_SESSION['user_data']['id'];

//======================================================================================================================
// Remove all old transactions
//======================================================================================================================
$query = "DELETE FROM `cash_transaction` WHERE `account_id`=$account_id";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}

$query = "DELETE FROM `account_watchlist` WHERE `account_id`=$account_id";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}

$query = "DELETE FROM `offset_trades` WHERE `account_id`=$account_id";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}

$query = "DELETE FROM `open_trades` WHERE `account_id`=$account_id";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}

$query = "DELETE FROM `transaction` WHERE `account_id`=$account_id";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}

$query = "DELETE FROM `user_connections` WHERE `user_id`=$account_id";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}


//======================================================================================================================
// Reset Account Balance for the Demo Account
//======================================================================================================================
//------------------------------------
// Initialize Demo Account Balances
//------------------------------------
$totalAsset = 100000;
$availableBalance = 100000;
$availableToTrade = 100000;

$updateQuery = "
    UPDATE `account` 
    SET `total_asset`    = $totalAsset, 
        `avail_balance`  = $availableBalance, 
        `avail_to_trade` = $availableToTrade
    WHERE `account_id` = $account_id";

$updateResult = mysqli_query($conn, $updateQuery);
if (!$updateResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_affected_rows($conn)!==1){
    throw new Exception('Error - unable to reset account balance');
}


?>