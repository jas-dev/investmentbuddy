<?php

require_once("mysqlconnect.php");
require_once("functions.php");
set_exception_handler("handleError");

$output = [
    "success"=>true,
    "stocks"=>[]
];

$getStocksQuery = "SELECT * FROM `stock`";
$getStocksResult = mysqli_query($conn, $getStocksQuery);

if (!$getStocksResult){
    throw new Exception(mysqli_error($conn));
}

while ($row = mysqli_fetch_assoc($getStocksResult)) {
    $symbol = $row["symbol"];
    $date = $row["datetime"];
    $price = $row["price"];
    $percentChange = $row["change_percent"];

    $stock = [
        "symbol"=>$symbol, 
        "timestamp"=>$date, 
        "price"=>$price, 
        "percentChange"=>$percentChange
    ];
    $output["stocks"][] = $stock;
}

print(json_encode($output));

?>


