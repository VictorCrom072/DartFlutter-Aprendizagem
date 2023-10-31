<?php
    include 'db_connection.php';
    $conn = dbConnection();
    if(isset($_POST["id"])){
        $id = $_POST["id"];
    }
    else return;
    $deletar= $conn->query("delete from tb_usuario where id_usu = '$id'");
    $arr=[];
    if($deletar == true){
        $arr[1] = true;
    }
    else{
        $arr[1] = false;
    }
    print(json_encode($arr));
?>