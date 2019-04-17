<?php
$key = "DA851C0JUW4Q00R0";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol=MSFT&apikey=$key");
$output = curl_exec($ch);
curl_close($ch);

print_r($output, true);

?>


