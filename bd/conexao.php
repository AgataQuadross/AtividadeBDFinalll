<?php
    $endereco = "localhost";
    $usuario = "root";
    $senha = "";
    $banco = "biblioteca";

    $conn = new mysqli($endereco, $usuario, $senha, $banco);

    if(!$conn){
        die("Falha na conexão: ". mysqli_connect_error());
    }

?>
