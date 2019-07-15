<?php

require_once('functions.php');
set_exception_handler("handleError");
require_once('config.php');
require_once('mysqlconnect.php');

if(empty($_SESSION['user_data']['id'])){
    throw new Exception('Missing account id');
}
$account_id = $_SESSION['user_data']['id'];

$output = [
    "success"=>false,
    "transactions"=>[]
];

$transactionsQuery = "SELECT * FROM `transaction` WHERE `account_id`=$account_id";
$transactionsResult = mysqli_query($conn, $transactionsQuery);
if (!$transactionsResult){
    throw new Exception(mysqli_error($conn));
}

while($row = mysqli_fetch_assoc($transactionsResult)){
    $transaction = [];

    $symbol = $row["symbol"];
    $nameQuery = "SELECT * FROM `company` WHERE `symbol`='$symbol'";
    $nameResult = mysqli_query($conn, $nameQuery);
    if (!$nameResult){
        throw new Exception(mysqli_error($conn));
    }
    $nameResult = mysqli_fetch_assoc($nameResult);

    $date = explode(" ", $row["trade_date"]);
    $date = explode("-", $date[0]);
    $month = $date[1];
    $day = $date[2];
    $year = $date[0];
    $date = "$month/$day/$year";

    $transaction["name"] = $nameResult["name"];
    $transaction["symbol"] = $symbol;
    $transaction["type"] = $row["buy_sell"];
    $transaction["price"] = $row["trade_price"];
    $transaction["quantity"] = $row["quantity"];
    $transaction["date"] = $date;
    $transaction["status"] = $row["status"];
    $transaction["amount"] = $row["amount"];

    $output["transactions"][] = $transaction;
}

print(json_encode($output));

?>




