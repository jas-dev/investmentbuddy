<?php

//set_exception_handler('handleError');
require_once("mysqlconnect.php");
$symbol = "FB";

//select date, close from stock_history where symbol='MSFT' order by date
$query = "SELECT `symbol`, `date`, `close` from `stock_history` where `symbol` = 
'$symbol' order by `date` LIMIT 100";

//var_dump($query);

$result = mysqli_query($conn, $query);

if (!$result){
    throw new Exception(mysqli_error($conn));
}

if(mysqli_num_rows($result) === 0){
    throw new Exception('Invalid ticker symbol');
}

$xdata = [];
$ydata = [];
while($row = mysqli_fetch_assoc($result)){
    $date=date_create($row['date']);
    $row['date'] = date_format($date,"Y/m/d");
    array_push($xdata, $row['date']);
    array_push($ydata, $row['close']);
};
print_r($xdata);
print_r($ydata);

$output = [
    'success'=>true,
    'stock'=> $xdata,
    'price'=> $ydata
];

//var_dump($output);
$json_output = json_encode($output );

//print($json_output);
echo($json_output);
?>