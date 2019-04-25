<?php
require_once('functions.php');
//require_once('config.php');
require_once('mysqlconnect.php');
set_exception_handler("handleError");

//=======================================================
// get list of stocks for an account based on watchlist
//=======================================================
$output = [
    'success' => false
];

//if(empty($_SESSION['acct_id'])){
//    throw new Exception('Missing account id');
//}
//$acct_id = $_SESSION['acct_id'];
$acct_id = 2;

$query="SELECT a.`account_id`, a.`symbol`, s.`datetime`, s.`price`, s.`change_percent` 
FROM `stock` as s JOIN `account_watchlist` as a ON s.`symbol` = a.`symbol` WHERE a.`account_id` = $acct_id";

$queryResult = mysqli_query($conn, $query);

if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) === 0){
    throw new Exception('no records returned - either account has no watchlist or the stock table is empty');
}

$output['stocks'] = [];
while($row = mysqli_fetch_assoc($queryResult)){
    $output['stocks'][] = [
        'symbol' => $row['symbol'],
        'timestamp' => $row['datetime'],
        'price' => $row['price'],
        'change_percent' => $row['change_percent']
    ];
};

$output['success'] = true;
print(json_encode($output));
?>