<?php
    include 'db_connection.php';
    $conn = dbConnection();
    if(isset($_POST["nome"])){
        $nome = $_POST["nome"];
    }
    else return;
    if(isset($_POST["email"])){
        $email = $_POST["email"];
    }
    else return;
    if(isset($_POST["senha"])){
        $senha = $_POST["senha"];
    }
    else return;
    $inserir= $conn->query("update tb_usuario set nome_usu = '$nome', senha_usu = '$senha' where email_usu = '$email'");
    $arr=[];
    if($inserir == true){
        $arr[1] = true;
    }
    else{
        $arr[1] = false;
    }
    print(json_encode($arr));
?>