<?php

require_once("functions.php");
require_once("mysqlconnect.php");
set_exception_handler("handleError");

$response = [
    "success"=>true,
    "indexData"=>[]
];

$query = "SELECT * FROM `market_index`";
$result = mysqli_query($conn, $query);

if (!$result){
    throw new Exception(mysqli_error($conn));
}

while ($row = mysqli_fetch_assoc($result)) {
    $symbol = $row["symbol"];
    $date = $row["date"];
    $price = $row["close"];

    $indexData = [
        "symbol"=>$symbol,
        "date"=>$date,
        "price"=>$price,
    ];
    $output["indexData"][] = $indexData;
}

print(json_encode($output));


?>
