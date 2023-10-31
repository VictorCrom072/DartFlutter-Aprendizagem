<?php
    include 'db_connection.php';
    $conn = dbConnection();

    $consulta= $conn->query("select * from tb_usuario");

    $arr=[];

    while($row = $consulta->fetch_array(PDO::FETCH_ASSOC))
    {
        $arr[] = $row;
    }
    print(json_encode($arr));
?>