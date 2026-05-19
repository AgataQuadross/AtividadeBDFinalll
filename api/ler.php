<?php
// Define o tipo de aplicação
header("Content-Type: application/json");
// Inclui a conexão com o banco de dados
include "../bd/conexao.php";

// Decodifica o json enviado pelo JavaScript
$json = json_decode(file_get_contents("php://input"), true);

// Pega o identificador do json
$codigo = $conn->real_escape_string($json["cod"]);
if (isset($json["cod"])) {
    $cod = (int) $json["cod"];
} else {
    $cod = 0;
}

if ($cod = 1) {
    $sql = "SELECT * FROM vw_livros_emprestados";
}
else if ($cod = 2) {

}
else if ($cod = 3) {

}
else if ($cod = 4) {

}
else if ($cod = 5) {

}
else if ($cod = 6) {

}
else {
    $sql = "erro";
}

if ($sql != "erro") {
    // Se não houver erro na opção, executa a query SQL
    $result = $conn->query($sql);

    $saidas = [];

    while ($row = $result->fetch_assoc()) {
        $saidas[] = $row;
    }
} else {
    // Se houver erro, envia a mensagem de erro
    $saidas[] = "ERRO: Opção de leitura inválida!";
}

// Codifica a resposta e envia
echo json_encode($saidas);
?>
