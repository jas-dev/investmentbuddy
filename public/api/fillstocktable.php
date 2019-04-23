<?php

$key = "DA851C0JUW4Q00R0";
$ticker;
$callType = "TIME_SERIES_INTRADAY";
require_once("mysqlconnect.php");

$stockList = [];
$stockListQuery = "SELECT * FROM `company`";
$stockListResult = mysqli_query($conn, $stockListQuery);

while ($row = mysqli_fetch_assoc($stockListResult)){
    array_push($stockList, $row["symbol"]);
}

for ($stockIndex=0; $stockIndex<count($stockList); $stockIndex++){
    $ticker = $stockList[$stockIndex];
    
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$ticker&interval=5min&apikey=$key");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $output = curl_exec($ch);
    curl_close($ch);

    $array_output = json_decode($output, true);
    $symbol = $array_output["Meta Data"]["2. Symbol"];
    $open;
    $high; 
    $low;
    $close;
    $volume;
    foreach ($array_output["Time Series (5min)"] as $value){
        $open = $value["1. open"];
        $high = $value["2. high"];
        $low = $value["3. low"];
        $close = $value["4. close"];
        $volume = $value["5. volume"];
        break;
    }

    $fillStockTableQuery = "INSERT INTO `stock` (`symbol`, `datetime`, `open`, `high`, `low`, `close`, `volume`)
                            VALUES ('$symbol', NOW(), $open, $high, $low, $close, $volume)";
    $fillStockTableResult = mysqli_query($conn, $fillStockTableQuery);

    sleep(30);
}

?>



