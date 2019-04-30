<?php

require_once('functions.php');
set_exception_handler("handleError");
require_once('config.php');
require_once('mysqlconnect.php');

$output = [
    "success" => false
];

if(empty($_SESSION['user_data']['id'])){
    throw new Exception('Missing account id');
}
$account_id = $_SESSION['user_data']['id'];
$symbol = $_GET["symbol"];

$query = "
    SELECT `symbol` 
    FROM `account_watchlist` 
    WHERE `account_id` = $account_id AND 
          `symbol` = '$symbol'
";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);

//===================================================================
//  verify the symbol does not already exist in the watchlist table
//===================================================================
if ($symbol === $row["symbol"]) {
    $output['message'] = "This symbol is already on your watchlist";
} else {
    // add new symbol to account's watchlist
    $query = "
        INSERT INTO `account_watchlist` 
            (`account_id`, `symbol`) 
        VALUES 
            ($account_id, '$symbol')
    ";

    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult) {
        throw new Exception('This symbol does not exist.');
    }
    $output['success'] = true;
    $output['message'] = "$symbol has been added to your watchlist";
}

print(json_encode($output));

?>