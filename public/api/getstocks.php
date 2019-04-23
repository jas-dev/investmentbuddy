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
    $date = explode(" ", $date);
    $date = explode("-", $date[0]);
    $month = $date[1];
    $day = $date[2];
    $year = $date[0];

    $date = "$month/$day/$year";
    
    $performance = $row["close"] - $row["open"];
    $performance = round($performance, 3, PHP_ROUND_HALF_UP);

    $price = $row["close"];

    $stock = [
        "symbol"=>$symbol,
        "performance"=>$performance, 
        "date"=>$date, 
        "price"=>$price
    ];
    $output["stocks"][] = $stock;
}

print(json_encode($output));

?>


