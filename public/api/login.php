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
$name = $_GET["name"];
$email = $_GET["email"];
$password = $_GET["password"];
//$name = 'Daniel Paschal';
//$email = 'dan@learning-fuze.com';
//$password = 'fluffybunny';

if($name === null || $email === null ){
    throw new Exception('name or email is a required value');
}
if($password === null){
    throw new Exception('password is a required value');
}
$email = addslashes($email);
$hashedPassword = sha1($password);
unset($input['password']);
$query = "SELECT `id`,`name` FROM `account` WHERE `email`='$email' AND `password`='$hashedPassword' ";
$queryResult = mysqli_query($conn, $query);
if (!$queryResult) {
    throw new Exception(mysqli_error($conn));
}
if (mysqli_num_rows($queryResult) !== 1) {
    throw new Exception("Invalid email or password");
}
$data = mysqli_fetch_assoc($queryResult);
$token = $email . $data['id'] . microtime();
$token = sha1($token);
$connect_query = "INSERT INTO `user_connections` SET 
	`token` = '$token',
	`user_id` = {$data['id']},
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
    'id'=>$data['id'],
    'username'=>$data['name'],
    'token'=>$token
];
$output['success'] = true;
$output['username'] = $data['name'];
$output['token'] = $token;
$json_output = json_encode($output);
print($json_output);
?>
