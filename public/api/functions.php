<?php

if (!function_exists('handleError')) {
    function handleError($error) {
        $output = [
            'success' => false,
            'error' => $error -> getMessage()
        ];

        $jsonoutput = json_encode($output);
        print($jsonoutput);
    }
}

if(!function_exists('handleCors')) {
    function handleCors() {
        header("Access-Control-Allow-Origin: *");

        // if OPTIONS request (asks 'what can I do?')
        if($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
            exit();
        }
    }
}

?>