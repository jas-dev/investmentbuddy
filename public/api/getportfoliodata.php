<?php

require_once('functions.php');
set_exception_handler("handleError");
require_once('config.php');
require_once('mysqlconnect.php');

if(empty($_SESSION['user_data']['id'])){
    throw new Exception('Missing account id');
}
$account_id = $_SESSION['user_data']['id'];

$output = [
    "success" => true,
    "openTrades" => [],
    "offsetTrades" => []
];

$openTradesQuery = "
    SELECT * 
    FROM `open_trades` 
    WHERE `account_id` = $account_id
";

$openTradesResult = mysqli_query($conn, $openTradesQuery);
if (!$openTradesResult){
    throw new Exception(mysqli_error($conn));
}

while($row = mysqli_fetch_assoc($openTradesResult)){
    $openTrade["symbol"] = $row["symbol"];
    $openTrade["originalDate"] = $row["orig_trade_date"];
    $openTrade["type"] = $row["buy_sell"];
    $openTrade["tradePrice"] = $row["trade_price"];
    $openTrade["quantity"] = $row["open_qty"];
    $openTrade["settlementDate"] = $row["settlement_date"];
    $openTrade["closePrice"] = $row["close_price"];
    $openTrade["unrealized"] = $row["unrealized_pl"];

    $output["openTrades"][] = $openTrade;
}

$offsetTradesQuery = "
    SELECT * 
    FROM `offset_trades` 
    WHERE `account_id` = $account_id
";

$offsetTradesResult = mysqli_query($conn, $offsetTradesQuery);
if (!$offsetTradesResult){
    throw new Exception(mysqli_error($conn));
}

while($row = mysqli_fetch_assoc($offsetTradesResult)){
    $offsetTrade["symbol"] = $row["symbol"];
    $offsetTrade["settlementDate"] = $row["settlement_date"];
    $offsetTrade["offsetQuantity"] = $row["offset_qty"];
    $offsetTrade["realizedPl"] = $row["realized_pl"];

    $output["offsetTrades"][] = $offsetTrade;
}

print(json_encode($output));

?>


