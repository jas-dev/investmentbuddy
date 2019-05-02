<?php
require_once("functions.php");
require_once("mysqlconnect.php");
set_exception_handler("handleError");

$output = [
    "success"=>true,
    "symbols"=>[],
    "prices"=>[],
];

//=======================================================================================
// get 3 major market indices and plot them on a multi-line chart
//=======================================================================================
$symbolList = ['DJ30','NAS100','SP500'];
$output["symbols"] = $symbolList;

//=======================================================================================
// loop through major market indices and prepare data for multi-line chart
//=======================================================================================
for ($symbolIndex=0; $symbolIndex<count($symbolList); $symbolIndex++){
    $query = "SELECT `date`, `close` FROM `market_index` WHERE `symbol` = '$symbolList[$symbolIndex]' ORDER BY `date` ASC";
    $result = mysqli_query($conn, $query);
    if (!$result){
        throw new Exception(mysqli_error($conn));
    }
    while ($row = mysqli_fetch_assoc($result)) {
        $output["prices"][$symbolIndex][$row["date"]] = $row["close"];
    }
}

print(json_encode($output));

?>
