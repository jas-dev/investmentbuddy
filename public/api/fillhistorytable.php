<?php
//exit;
$APIkey = "DA851C0JUW4Q00R0";
$ticker = "A";
$callType = "TIME_SERIES_DAILY";

require_once("mysqlconnect.php");
require_once("functions.php");
set_exception_handler("handleError");

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://www.alphavantage.co/query?function=$callType&symbol=$ticker&outputsize=full&apikey=$APIkey");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$output = curl_exec($ch);
curl_close($ch);

$array_output = json_decode($output, true);
$data = $array_output["Time Series (Daily)"];

$counter = 0;
foreach ($data as $key=>$value) {
    if ($counter >= 300){
        break;
    }

    $open = $data[$key]["1. open"];
    $high = $data[$key]["2. high"];
    $low = $data[$key]["3. low"];
    $close = $data[$key]["4. close"];
    $volume = $data[$key]["5. volume"];

    $query = "INSERT INTO `stock_history` (`symbol`, `date`, `open`, `high`, `low`, `close`, `volume`)
               VALUES ('$ticker', '$key', '$open', '$high', '$low', '$close', '$volume')"; 
    
    mysqli_query($conn, $query);
$counter++;
}



?>


