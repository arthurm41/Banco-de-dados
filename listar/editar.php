<?php
$conn = new mysqli("localhost", "root", "1976", "livraria");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$id = $_GET["id_usuario"];
$result = $conn->query("SELECT * FROM usuarios WHERE id_usuario = $id");
$row = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuário</title>
    <link rel="stylesheet" href="editar.css">
</head>
<body>
    <h1>Editar Usuário</h1>

    <form action="atualizar.php" method="POST" class="form-editar">
        <input type="hidden" name="id_usuario" value="<?php echo $row['id_usuario']; ?>">

        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<?php echo htmlspecialchars($row['nome']); ?>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($row['email']); ?>" required>

        <input type="submit" value="Atualizar">
    </form>

    <div class="links">
        <a href="index.php">Voltar à lista</a>
    </div>
</body>
</html>

<?php
$conn->close();
?>
