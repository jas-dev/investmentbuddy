<?php

require_once('functions.php');
set_exception_handler("handleError");
require_once('config.php');
require_once('mysqlconnect.php');

$output = [
    'success' => false
];

if(empty($_SESSION['user_data']['id'])){
    throw new Exception('Missing account id');
}
$account_id = $_SESSION['user_data']['id'];
$amount = (int)$_GET["amount"];

$accountQuery = "
    SELECT `total_asset`, `avail_balance`, `avail_to_trade` 
    FROM `account` 
    WHERE `account_id` = $account_id";

$accountQueryResult = mysqli_query($conn, $accountQuery);
if (!$accountQueryResult){
    throw new Exception(mysqli_error($conn));
}

$row = mysqli_fetch_assoc($accountQueryResult);
$availableBalance = $row["avail_balance"];
$availableToTrade = $row["avail_to_trade"];
$totalAsset = $row["total_asset"];

$availableBalance = $availableBalance+$amount;
$availableToTrade = $availableToTrade+$amount;
$totalAsset = $totalAsset+$amount;

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

//=====================================================================================
// insert the new cash transaction in cash_transaction table
//=====================================================================================
$timestamp = date_create('now')->format('Y-m-d H:i:s');
$query="
    INSERT INTO `cash_transaction` 
        (`account_id`, `date`, `trans_type`, `amount`) 
    VALUES
        ($account_id, '$timestamp', 'D', $amount)";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

$output = [
    "success" => true,
    'message' => "$$amount was added to your funds."
];

print(json_encode($output));

?>