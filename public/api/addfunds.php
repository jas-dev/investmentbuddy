<?php

require_once("functions.php");
set_exception_handler("handleError");

require_once("mysqlconnect.php");

//$accountId = $_GET["account_id"];
//$amount = $_GET["amount"];
$accountId = 2;

$accountQuery = "SELECT `total_asset`, `avail_balance`, `avail_to_trade` FROM `account` WHERE `account_id`=$accountId";
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

$updateQuery = "UPDATE `account` SET `total_asset`=$totalAsset, `avail_balance`=$availableBalance, `avail_to_trade`=$availableToTrade WHERE `account_id`=$accountId";
$updateResult = mysqli_query($conn, $updateQuery);
if (!$updateResult){
    throw new Exception(mysqli_error($conn));
}

$output = [
    "success"=>true
];
print(json_encode($output));

?>