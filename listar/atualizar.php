<?php
$conn = new mysqli("localhost", "root", "1976", "livraria");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$id = $_POST['id_usuario'];
$nome = $_POST['nome'];
$email = $_POST['email'];

$stmt = $conn->prepare("UPDATE usuarios SET nome=?, email=? WHERE id_usuario=?");
$stmt->bind_param("ssi", $nome, $email, $id);

if ($stmt->execute()) {
    echo "Usuário atualizado com sucesso!<br>";
} else {
    echo "Erro ao atualizar: " . $stmt->error;
}

echo "<a href='index.php'>Voltar</a>";

$stmt->close();
$conn->close();
?>
