<?php
$conn = new mysqli("localhost", "root", "1976", "livraria");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$id = $_GET["id"];

$stmt = $conn->prepare("DELETE FROM usuarios WHERE id_usuario = ?");
$stmt->bind_param("i", $id);

$mensagem = "";
if ($stmt->execute()) {
    $mensagem = "Usuário deletado com sucesso!";
} else {
    $mensagem = "Erro ao deletar: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deletar Usuário</title>
    <link rel="stylesheet" href="deletar.css">
</head>
<body>
    <div class="container">
        <h1>Remoção de Usuário</h1>
        <p class="mensagem"><?= htmlspecialchars($mensagem) ?></p>
        <a href="index.php" class="botao">Voltar à Lista</a>
    </div>
</body>
</html>
