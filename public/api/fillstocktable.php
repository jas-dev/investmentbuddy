<?php

$key = "DA851C0JUW4Q00R0";
$ticker;
$callType = "GLOBAL_QUOTE";
require_once("mysqlconnect.php");
require_once("functions.php");

set_exception_handler("handleError");

$stockList = [];
$stockListQuery = "SELECT * FROM `company`";
$stockListResult = mysqli_query($conn, $stockListQuery);

while ($row = mysqli_fetch_assoc($stockListResult)){
    array_push($stockList, $row["symbol"]);
}
$counter = 0;
for ($stockIndex=0; $stockIndex<count($stockList); $stockIndex++){
    if ($counter>2){
        break;
    }

    $ticker = $stockList[$stockIndex];
    
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "https://www.alphavantage.co/query?function=$callType&symbol=$ticker&apikey=$key");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $output = curl_exec($ch);
    curl_close($ch);

    $array_output = json_decode($output, true);
    $globalQuote = $array_output["Global Quote"];

    $symbol = $globalQuote["01. symbol"];
    $open = $globalQuote["02. open"];
    $high = $globalQuote["03. high"];
    $low = $globalQuote["04. low"];
    $price = $globalQuote["05. price"];
    $volume = $globalQuote["06. volume"];
    $latestTradingDay = $globalQuote["07. latest trading day"];
    $previousClose = $globalQuote["08. previous close"];
    $changeAmount = $globalQuote["09. change"];
    $changePercent = $globalQuote["10. change percent"];
    $changePercent = substr($changePercent, 0, -1);

    $fillStockTableQuery = "INSERT INTO `stock` (`symbol`, `datetime`, `open`, `high`, `low`, `price`, `volume`, `latest_trade_day`, `previous_close`, `change_amount`, `change_percent`)
                            VALUES ('$symbol', NOW(), $open, $high, $low, $price, $volume, '$latestTradingDay', $previousClose, $changeAmount, $changePercent)";
    $fillStockTableResult = mysqli_query($conn, $fillStockTableQuery);

    if (!$fillStockTableResult){
        throw new Exception(mysqli_error($conn));
    }

    sleep(30);
    $counter++;
}

//the counter variable exists for testing purposes, so the program only takes a little bit of time to run 
?>



