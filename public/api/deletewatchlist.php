<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

$output = [
    "success"=>false,
    "message"=>""
];

$accountId = $_GET["account_id"];
$symbol = $_GET["symbol"];
//$accountId = 2;
//$symbol = 'MSFT';

$query = "SELECT `symbol` FROM `account_watchlist` 
WHERE `account_id`=$accountId AND `symbol`='$symbol' ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);

//===================================================================
//  verify the symbol does not already exist in the watchlist table
//===================================================================
if ($symbol === $row["symbol"]) {
    // delete symbol from account's watchlist
    $query = "DELETE FROM `account_watchlist` WHERE `account_id` = $accountId
      AND `symbol` = '$symbol' ";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult){
        throw new Exception(mysqli_error($conn));
    }
    $output['success']=true;
    $output['message']="$symbol has been removed from your watchlist";
} else {
    $output['message']="This symbol is NOT on your watchlist - unable to delete";
}

print(json_encode($output));

?>