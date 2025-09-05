<?php

    $servername = "localhost"; 
    $username   = "root";      
    $password   = "senaisp";          
    $dbname     = "transporte_sa";  

    $conn = new mysqli($localhost, $root, $senaisp, $transporte_sa);

    if ($conn->connect_error) {
        die("Falha na conexão: " . $conn->connect_error);
    } else {
        echo "Conexão feita com sucesso!";
    }

?>