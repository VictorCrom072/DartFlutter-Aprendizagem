<?php
    function dbConnection(){
        $servidor = "Localhost";
        $usuario = "root";
        $banco = "db_api";
        $senha = "12345678";
        //$conn = new PDO("mysql:host=$servidor;dbname=$banco", $usuario, $senha);
        $conn = mysqli_connect("localhost", "root", "12345678", "db_api");
        return $conn;
    } 
?> 