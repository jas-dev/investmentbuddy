<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

//=======================================================
// get current account balance
//=======================================================
//$accountId = $_GET["account_id"];
$accountId = 2;

$output = [
    'success' => false
];

$accountQuery = "SELECT `total_asset`, `avail_balance`, `avail_to_trade` FROM `account` WHERE `account_id`=$accountId";
$accountQueryResult = mysqli_query($conn, $accountQuery);
if (!$accountQueryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($accountQueryResult) === 0){
    throw new Exception('no records returned');
}

$row = mysqli_fetch_assoc($accountQueryResult);
$output['account_balance'] = [];

$output = [
    "success"=>true,
    "total_asset" => round($row["total_asset"],2),
    "avail_balance" => round($row["avail_balance"],2),
    "avail_to_trade" => round($row["avail_to_trade"],2)
];
print(json_encode($output));

?>