<?php
$conn = new mysqli("localhost", "root", "1976", "livraria");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$result = $conn->query("SELECT * FROM usuarios");
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuários</title>
    <link rel="stylesheet" href="styleindex.css">
</head>
<body>
    <header>
        <h1>Usuários Cadastrados</h1>
        <nav>
            <a href="index.html" class="botao">Cadastrar Novo Usuário</a>
        </nav>
    </header>

    <main class="container">
        <table>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Ações</th>
            </tr>
            <?php while($row = $result->fetch_assoc()): ?>
            <tr>
                <td><?= $row['id_usuario'] ?></td>
                <td><?= htmlspecialchars($row['nome']) ?></td>
                <td><?= htmlspecialchars($row['email']) ?></td>
                <td>
                    <a href="editar.php?id_usuario=<?= $row['id_usuario'] ?>">Editar</a> |
                    <a href="deletar.php?id=<?= $row['id_usuario'] ?>" onclick="return confirm('Tem certeza que deseja excluir este usuário?')">Excluir</a>
                </td>
            </tr>
            <?php endwhile; ?>
        </table>
    </main>
</body>
</html>

<?php
$conn->close();
?>
