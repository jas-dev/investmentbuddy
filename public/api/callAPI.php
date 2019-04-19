<?php

$key = "DA851C0JUW4Q00R0";
$ticker = "MSFT";
$callType = "TIME_SERIES_DAILY";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://www.alphavantage.co/query?function=$callType&symbol=$ticker&interval=5min&apikey=$key");
$output = curl_exec($ch);
curl_close($ch);

print($output);

?>


