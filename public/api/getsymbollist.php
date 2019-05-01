<?php

require_once("functions.php");
require_once("mysqlconnect.php");

$symbolListQuery = "SELECT * FROM `company`";
$symbolListResult = mysqli_query($conn, $symbolListQuery);

$symbolList = [];
while($row = mysqli_fetch_assoc($symbolListResult)){
    $symbolList[] = $row["symbol"];
}

print(json_encode($symbolList));

?>


