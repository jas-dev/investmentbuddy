<?php
require_once('functions.php');
//require_once('config.php');
require_once('mysqlconnect.php');
set_exception_handler("handleError");

//=======================================================
// get list of cash transactions for this account
//=======================================================
$output = [
    'success' => false
];

//if(empty($_SESSION['acct_id'])){
//    throw new Exception('Missing account id');
//}
//$acct_id = $_SESSION['acct_id'];
$acct_id = 2;

$query="SELECT `date`, `trans_type`, `amount`, `memo` FROM `cash_transaction` WHERE `account_id` = $acct_id";

$queryResult = mysqli_query($conn, $query);

if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_num_rows($queryResult) === 0){
    throw new Exception('no records returned');
}

$output['cash_transaction'] = [];
while($row = mysqli_fetch_assoc($queryResult)){
    $output['cash_transaction'][] = [
        'date' => $row['date'],
        'trans_type' => $row['trans_type'],
        'amount' => $row['amount'],
        'memo' => $row['memo']
    ];
};

$output['success'] = true;
print(json_encode($output));
?>