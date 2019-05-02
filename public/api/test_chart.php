<?php

//======================================================================
// this code was used to test creating chart - not used for application
//======================================================================

//set_exception_handler('handleError');
require_once("mysqlconnect.php");
$symbol = "FB";

//select date, close from stock_history where symbol='MSFT' order by date
$query = "SELECT `symbol`, `date`, `close` from `stock_history` where `symbol` = 
'$symbol' order by `date` LIMIT 300";

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

$output = [
    'success' => true,
    'stock' => [
        $symbol =>
        ['date' => $xdata, 'price'=> $ydata]
       ]
];

print(json_encode($output));

?>