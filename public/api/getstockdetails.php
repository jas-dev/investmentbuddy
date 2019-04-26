<?php

require_once("functions.php");
$key = "DA851C0JUW4Q00R0";
$ticker = $_GET["stock_symbol"]; //will soon be retrieved dynamically from the frontend request
$callType = "GLOBAL_QUOTE";
require_once("mysqlconnect.php");

set_exception_handler("handleError");

$response = [
    "success"=>true,
    "company"=>[],
    "stock"=>[], 
    "history"=>[]
];

$companyQuery = "SELECT * FROM `company` WHERE `symbol`='$ticker'";
$companyQueryResult = mysqli_query($conn, $companyQuery);
if (!$companyQueryResult){
    throw new Exception(mysqli_error($conn));
}

$companyData = mysqli_fetch_assoc($companyQueryResult);
$response["company"]["name"] = $companyData["name"];
$response["company"]["symbol"] = $ticker;
$response["company"]["GICS"] = $companyData["GICS"];
$response["company"]["category"] = $companyData["category"];
$response["company"]["headquarters"] = $companyData["headquarter"];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://www.alphavantage.co/query?function=$callType&symbol=$ticker&apikey=$key");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$output = curl_exec($ch);

curl_close($ch);



$array_output = json_decode($output, true);

$data = $array_output["Global Quote"];


$open = $data["02. open"];
$high = $data["03. high"];
$low = $data["04. low"];
$price = $data["05. price"];
$volume = $data["06. volume"];
$latestTradingDay = $data["07. latest trading day"];
$previousClose = $data["08. previous close"];
$changeAmount = $data["09. change"];
$changePercent = $data["10. change percent"];
$changePercent = substr($changePercent, 0, -1);

$updateStockTableQuery = "UPDATE `stock` SET `datetime`=NOW(), 
                            `high`=$high, `low`=$low, `price`=$price, `volume`=$volume, 
                            `latest_trade_day`='$latestTradingDay', `previous_close`=$previousClose, `change_amount`=$changeAmount,
                            `change_percent`=$changePercent WHERE `symbol`='$ticker'";

$updateStockTableResult = mysqli_query($conn, $updateStockTableQuery);
if (!$updateStockTableResult){
    throw new Exception(mysqli_error($conn));
}

$response["stock"]["open"] = $open;
$response["stock"]["high"] = $high;
$response["stock"]["low"] = $low;
$response["stock"]["price"] = $price;
$response["stock"]["volume"] = $volume;
$response["stock"]["latestTradingDay"] = $latestTradingDay;
$response["stock"]["previousClose"] = $previousClose;
$response["stock"]["changeAmount"] = $changeAmount;
$response["stock"]["changePercent"] = $changePercent;

$historyQuery = "SELECT * FROM `stock_history` WHERE `symbol`='$ticker'";
$historyResult = mysqli_query($conn, $historyQuery);
if (!$historyResult){
    throw new Exception(mysqli_error($conn));
}

while($row=mysqli_fetch_assoc($historyResult)){
    
    $response["history"][$row["date"]] = $row["close"];
}

print(json_encode($response));

?>



