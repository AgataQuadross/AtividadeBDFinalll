<?php
    $endereco = "localhost";
    $usuario = "root";
    $senha = "";
    $banco = "biblioteca";

    $conexao = mysqli_connect($endereco, $usuario, $senha, $banco);

    if(!$conexao){
        die("Falha na conexão: ". mysqli_connect_error())
    }

    echo "Conexão Realizada com Sucesso!!<br><br>";
?>