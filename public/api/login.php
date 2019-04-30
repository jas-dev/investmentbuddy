<?php

require_once("functions.php");
set_exception_handler("handleError");
require_once("mysqlconnect.php");

$output = [
    "success"=>false
];

//==============================================================================================
// For LOGIN authentication - user is required to enter:
//  (1) either name or email (if both are entered, use only name to verify)
//  (2) password (required input)
//==============================================================================================
//$json_input = file_get_contents("php://input");
//$input = json_decode($json_input, true);  //true-convert all objects to associative arrays, as opposed to standard class object
//$name = $input['name'];
//$password = $input['password'];
$name = 'Daniel Paschal';
$password = 'fluffybunny';

if($name === null) {
    throw new Exception('name is a required value');
}
if($password === null){
    throw new Exception('password is a required value');
}
//unset($input['password']);

$query = "SELECT `account_id`,`name` FROM `account` WHERE `name`='$name' AND `password`='$password' ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}
if (mysqli_num_rows($queryResult) !== 1) {
    throw new Exception("Invalid username or password");
}
$data = mysqli_fetch_assoc($queryResult);
$token = $name . $data['account_id'] . microtime();
$token = sha1($token);
$connect_query = "INSERT INTO `user_connections` SET 
	`token` = '$token',
	`user_id` = {$data['account_id']},
	`created` = NOW(),
	`ip_address` = '{$_SERVER['REMOTE_ADDR']}'
";
$connect_result = mysqli_query($conn, $connect_query);
if(!$connect_result){
    throw new Exception(mysqli_error($conn));
}
if(mysqli_affected_rows($conn)!==1){
    throw new Exception('could not log you in: connection not saved');
}
$_SESSION['user_data'] = [
    'id'=>$data['account_id'],
    'username'=>$data['name'],
    'token'=>$token
];
$output['success'] = true;
$output['id'] = $data['account_id'];
$output['username'] = $data['name'];
$output['token'] = $token;
$json_output = json_encode($output);
print($json_output);
?>
