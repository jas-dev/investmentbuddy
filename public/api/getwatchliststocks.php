<?php

require_once('functions.php');
set_exception_handler("handleError");
require_once('config.php');
require_once('mysqlconnect.php');

//=======================================================
// get list of stocks for an account based on watchlist
//=======================================================
$output = [
    'success' => false
];

if(empty($_SESSION['user_data']['id'])){
    throw new Exception('Missing account id');
}
$account_id = $_SESSION['user_data']['id'];

$query = "
    SELECT a.`account_id`, a.`symbol`, s.`datetime`, s.`price`, s.`change_percent` 
    FROM (SELECT `symbol`, `datetime`, `price`, `change_percent` 
          FROM `stock`
          WHERE `datetime` in 
                (SELECT MAX(`datetime`) 
                 FROM `stock`
                 GROUP BY `symbol`)) as s
    JOIN `account_watchlist` as a ON s.`symbol` = a.`symbol`
    WHERE a.`account_id` = $account_id
";

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
