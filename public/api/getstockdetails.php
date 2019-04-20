<?php

$key = "DA851C0JUW4Q00R0";
$ticker = "FB";
$callType = "TIME_SERIES_INTRADAY";
require_once("mysqlconnect.php");

$response = [
    "success"=>true,
    "stock"=>[
        "name"=>"Facebook", 
        "symbol"=>$ticker, 
        "current"=>""
    ]
];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://www.alphavantage.co/query?function=$callType&symbol=$ticker&outputsize=full&interval=5min&apikey=$key");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$output = curl_exec($ch);
curl_close($ch);

$array_output = json_decode($output, true);
$data = $array_output["Time Series (5min)"];

$current;
foreach ($data as $value) {
    $current = $value["4. close"];
    break;
}
$response["stock"]["current"] = $current;

$historyQuery = "SELECT * FROM `stock_history` WHERE `symbol`='$ticker'";
$historyResult = mysqli_query($conn, $historyQuery);

while($row=mysqli_fetch_assoc($historyResult)){
    
    $response["stock"]["history"][$row["date"]] = $row["close"];
    
}

print_r($response);

?>



