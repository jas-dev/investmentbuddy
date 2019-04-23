<?php

function handleError($error){
    $output = [
        "success"=>false,
        "message"=>$error->getMessage()
    ];
    print(json_encode($output));
}

?>