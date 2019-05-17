<?php

require_once('functions.php');
set_exception_handler("handleError");
require_once('config.php');
require_once('mysqlconnect.php');

$output = [
    'success' => false
];
$new_account = false;

//======================================================================================================================
// check if demo account already exist? if not, create a new account called demo
//======================================================================================================================
$query = "SELECT `account_id`,`name` FROM `account` WHERE `name`='demo' ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}
if (mysqli_num_rows($queryResult) === 0) {
    //----------------------------------------------------------------------------
    // insert into account table - add a new account with name='demo'
    //----------------------------------------------------------------------------
    $demo_query = "INSERT INTO `account` (`name`, `password`, `total_asset`, `avail_balance`, `avail_to_trade`) 
                    VALUES ('demo','demo',100000, 100000, 100000)";
    $demo_query_result = mysqli_query($conn, $demo_query);
    if(!$demo_query_result){
        throw new Exception(mysqli_error($conn));
    }
    if(mysqli_affected_rows($conn)!==1){
        throw new Exception('unable to create new demo account.');
    }
    //----------------------------------------------------------------------------
    // query again to get the new account id auto-assigned by the database
    //----------------------------------------------------------------------------
    $query = "SELECT `account_id`,`name` FROM `account` WHERE `name`='demo' ";
    $queryResult = mysqli_query($conn, $query);
    if (!$queryResult) {
        throw new Exception(mysqli_error($conn));
    }
    if (mysqli_affected_rows($conn)!==1) {
        throw new Exception('unable to fetch the newly created demo account.');
    }
    $new_account = true;
}

//======================================================================================================================
//  register demo account in $_SESSION
//======================================================================================================================
$data = mysqli_fetch_assoc($queryResult);   //demo account already exist
$account_id = $data['account_id'];

// setup a token for this demo account and register it in $_SESSION
$token = $data['name'] . $data['account_id'] . microtime();
$token = sha1($token);

$_SESSION['user_data'] = [
    'id'=>$data['account_id'],
    'username'=>$data['name'],
    'token'=>$token
];
$output['userData'] = [
    'id'=>$data['account_id'],
    'username'=>$data['name'],
    'token'=>$token
];

//======================================================================================================================
//  If this was an old demo account - reset to new condition by deleting all the old transactions
//======================================================================================================================
if (!$new_account){
    include_once('reset_demo_account.php');
}

//======================================================================================================================
//  Record the demo user session token
//======================================================================================================================
$connect_query = "
    INSERT INTO `user_connections` 
    SET `token` = '$token',
	    `user_id` = $account_id,
    	`created` = NOW(),
	    `ip_address` = '{$_SERVER['REMOTE_ADDR']}'";

$connect_result = mysqli_query($conn, $connect_query);
if(!$connect_result){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_affected_rows($conn)!==1){
    throw new Exception('could not log you in: connection not saved');
}

//======================================================================================================================
// setup the account with these basic condition:
// 1. add $10,000 in cash_transaction
// 2. update account balance => already done with insert new account or reset old account
// 2. add 5 watchlist stocks in account_watchlist table
// 3. add stock transactions (including a buy/sell pair)
// 4. add open trades
// 5. execute trade offsets - include_once('offsettrades.php');
//======================================================================================================================

//=====================================================================================
// insert the new cash transaction in cash_transaction table
//=====================================================================================
$timestamp = date_create('now')->format('Y-m-d H:i:s');
$amount = 100000;
$query="INSERT INTO `cash_transaction` (`account_id`, `date`, `trans_type`, `amount`) 
    VALUES ($account_id, '$timestamp', 'D', $amount)";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}


//=====================================================================================================
// add stock transactions to demo account watchlist
//=====================================================================================================
$query = "INSERT INTO `account_watchlist` (`account_id`, `symbol`) VALUES 
      ($account_id, 'MSFT'),($account_id, 'AMZN'),
      ($account_id, 'AAPL'),($account_id, 'FB'),($account_id, 'GOOGL')";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
//  insert a new BUY trade in transaction table - this is a multi-step process
// Step 1: add the new trade in transaction table
//=====================================================================================================
$symbol = 'AAPL';
$buy_sell = 'B';
$price = 157;
$shares = 100;
if($buy_sell === 'B'){
    $amountRequired = -1 * $price * $shares;
} else {
    $amountRequired = $price * $shares;
}
$timestamp = date_create('2019-01-02 10:15:30')->format('Y-m-d H:i:s');
$query = "
    INSERT INTO `transaction` 
        (`account_id`, `trade_date`, `symbol`, `buy_sell`, `trade_price`, `quantity`, `status`, `amount`) 
    VALUES 
           ($account_id, '$timestamp', '$symbol', '$buy_sell', $price, $shares, 'Open', $amountRequired)
";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
// Step 2: insert new trade in open trade table - this is a two step process
//      (1) need to get the newly created trade transaction id and timestamp from transaction table
//      (2) create a new record in open_trades table
//=====================================================================================================
$query = "
    SELECT `id`, `trade_date`, `account_id`, `symbol` 
    FROM `transaction` 
    WHERE `id` =(
        SELECT MAX(id) 
        FROM `transaction` 
        WHERE `account_id` = $account_id AND 
              `symbol` = '$symbol')
";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);
$newTradeId = $row["id"];
$newTradeDateTime = $row["trade_date"];

$settlementDate = date_create('2019-04-29 17:11:25')->format('Y-m-d H:i:s');
$settlementDatePrice = 204.61;

//insert into open_trades (account_id, orig_trade_id, orig_trade_date, symbol, buy_sell, trade_price, open_qty)
$query = "
    INSERT INTO `open_trades` 
        (`account_id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty`, `settlement_date`, `close_price`, `unrealized_pl`) 
    VALUES 
        ($account_id, $newTradeId, '$newTradeDateTime', '$symbol', '$buy_sell', $price, $shares, '$settlementDate', $settlementDatePrice, 0 )
";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
//  insert a new SELL trade in transaction table - this is a multi-step process
// Step 1: add the new trade in transaction table
//=====================================================================================================
$symbol = 'AAPL';
$buy_sell = 'S';
$price = 204;
$shares = 70;
if($buy_sell === 'B'){
    $amountRequired = -1 * $price * $shares;
} else {
    $amountRequired = $price * $shares;
}
$timestamp = date_create('2019-04-29 11:05:15')->format('Y-m-d H:i:s');
$query = "
    INSERT INTO `transaction` 
        (`account_id`, `trade_date`, `symbol`, `buy_sell`, `trade_price`, `quantity`, `status`, `amount`) 
    VALUES 
           ($account_id, '$timestamp', '$symbol', '$buy_sell', $price, $shares, 'Open', $amountRequired)
";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
// Step 2: insert new trade in open trade table - this is a two step process
//      (1) need to get the newly created trade transaction id and timestamp from transaction table
//      (2) create a new record in open_trades table
//=====================================================================================================
$query = "
    SELECT `id`, `trade_date`, `account_id`, `symbol` 
    FROM `transaction` 
    WHERE `id` =(
        SELECT MAX(id) 
        FROM `transaction` 
        WHERE `account_id` = $account_id AND 
              `symbol` = '$symbol')
";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}
$row = mysqli_fetch_assoc($queryResult);
$newTradeId = $row["id"];
$newTradeDateTime = $row["trade_date"];

$settlementDate = date_create('2019-04-29 17:11:25')->format('Y-m-d H:i:s');
$settlementDatePrice = 204.61;

//insert into open_trades (account_id, orig_trade_id, orig_trade_date, symbol, buy_sell, trade_price, open_qty)
$query = "
    INSERT INTO `open_trades` 
        (`account_id`, `orig_trade_id`, `orig_trade_date`, `symbol`, `buy_sell`, `trade_price`, `open_qty`, `settlement_date`, `close_price`, `unrealized_pl`) 
    VALUES 
        ($account_id, $newTradeId, '$newTradeDateTime', '$symbol', '$buy_sell', $price, $shares, '$settlementDate', $settlementDatePrice, 0 )
";

$queryResult = mysqli_query($conn, $query);
if (!$queryResult){
    throw new Exception(mysqli_error($conn));
}

//=====================================================================================================
//  For the SELL transaction - execute trade offset
//=====================================================================================================

include_once('offsettrades.php');

$output['success'] = true;
$output['message'] = 'Demo account has been successfully setup.';

print(json_encode($output));

?>