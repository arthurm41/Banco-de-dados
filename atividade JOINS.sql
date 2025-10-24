-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS joins;
USE joins;

-- Criar a tabela de clientes
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL
);

-- Criar a tabela de produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome_produto VARCHAR(100) NOT NULL,
    descricao_produto VARCHAR(100) NOT NULL,
    valor_produto DECIMAL(7, 2)
);

-- Criar a tabela de vendas
CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_venda DECIMAL(7, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserir dados na tabela cliente
INSERT INTO cliente (id_cliente, nome_cliente, endereco, cidade, estado, cep) VALUES
(250, 'BANCO BARCA S/A', 'R. VITO, 34', 'SAO SEBASTIAO', 'CE', '62380-000'),
(820, 'MECANICA SAO PAULO', 'R. DO MACUCO, 99', 'SANTO ANTONIO', 'ES', '29810-020'),
(170, 'POSTO BRASIL LTDA.', 'AV. IMPERIO, 85', 'GUAGIRUS', 'BA', '42837-000'),
(340, 'TRANSP. CARGA PESADA LTDA.', 'AV. DOS AUTONOMISTAS, 1000', 'OSASCO', 'SP', '06020-010'),
(100, 'MICROS INFORMATICA S/A', 'R. DAS PALMEIRAS, 4 - LOJA 2', 'SAO PAULO', 'SP', '01226-010'),
(750, 'IMOBILIARIA PAVAO', 'AV. BRASIL, 105', 'RIO DO PRADO', 'MG', '39940-111'),
(860, 'ASSIS CONTABIL S/C LTDA.', 'R. DO MONUMENTO, 550', 'SANTO AMARO', 'BA', '44200-090'),
(230, 'SUPERMERCADO BOTAFOGO', 'R. DA LAGOA, 999', 'RIO DAS OSTRAS', 'RJ', '28890-540'),
(150, 'MARCONDES E IRMAO LTDA.', 'R. DO ORATORIO, 66', 'ROSARIO OESTE', 'MT', '78470-010'),
(800, 'DOCEIRA PAO DE ACUCAR', 'R. MARTINS PENA, 200', 'SANTO ANDRE', 'SP', '09190-700'),
(990, 'METALURGICA FOGO E FERRO', 'R. ARTUR BERNARDES, 3500', 'SANTO ANDRE', 'SP', '09193-410'),
(500, 'JOSE DANTAS E FILHOS S/C LTDA.', 'AV. IPIRANGA, 1000', 'LUCRECIA', 'RN', '59805-010'),
(300, 'PCTEC - MICROCOMPUTADORES S/A.', 'R. CAIS DO PORTO, ARMAZEM 3', 'SANTOS', 'SP', '11000-005'),
(550, 'ROTRAM COMERCIAL LTDA.', 'R. DAS PALMEIRAS, 45 - CJ 10', 'SAO PAULO', 'SP', '01226-010');

-- Inserir dados na tabela produtos
INSERT INTO produtos (nome_produto, descricao_produto, valor_produto) VALUES
('Produto A', 'Descrição do Produto A', 50.00),
('Produto B', 'Descrição do Produto B', 100.00),
('Produto C', 'Descrição do Produto C', 150.00);

-- Inserir dados na tabela vendas
INSERT INTO vendas (id_cliente, id_produto, quantidade, valor_venda) VALUES
(230, 1, 2, 100.00),
(820, 2, 1, 1000.00),
(170, 3, 1, 150.00),
(750, 1, 3, 150.00),
(230, 2, 1, 200.00),
(340, 3, 4, 600.00),
(100, 1, 2, 100.00),
(550, 2, 3, 300.00);
-- exercicio 1 --
SELECT 
    c.nome_cliente AS "Cliente",
    v.id_venda AS "Número da Duplicata",
    v.valor_venda AS "Valor"
FROM 
    cliente c
JOIN 
    vendas v ON c.id_cliente = v.id_cliente
WHERE 
    c.nome_cliente = 'PCTEC - MICROCOMPUTADORES S/A.';
    -- exercicio 2 --
SELECT 
    c.nome_cliente AS "Cliente",
    v.data_venda AS "Data de Vencimento",
    v.valor_venda AS "Valor da Duplicata"
FROM 
    cliente c
JOIN 
    venda v ON c.id_cliente = v.id_cliente
WHERE 
    YEAR(v.data_venda) = 2004
    AND MONTH(v.data_venda) = 11
ORDER BY 
    v.data_venda ASC;
	-- exercicio 3 --
SELECT 
    c.nome_cliente AS "Cliente",
    v.id_venda AS "Número da Duplicata",
    v.data_venda AS "Data de Vencimento",
    v.valor_venda AS "Valor da Duplicata"
FROM 
    cliente c
JOIN 
    venda v ON c.id_cliente = v.id_cliente
WHERE 
    MONTH(v.data_venda) = 10
ORDER BY 
    v.data_venda ASC;
    -- exercicio 4 --
    SELECT 
    c.nome_cliente AS "Cliente",
    COUNT(v.id_venda) AS "Quantidade de Títulos",
    SUM(v.valor_venda) AS "Total Devido"
FROM 
    cliente c
JOIN 
    venda v ON c.id_cliente = v.id_cliente
GROUP BY 
    c.nome_cliente
ORDER BY 
    SUM(v.valor_venda) DESC;
	-- exercicio 5 --
SELECT 
    c.nome_cliente AS "Cliente",
    COUNT(v.id_venda) AS "Quantidade de Títulos",
    SUM(v.valor_venda) AS "Total_Duplicatas"
FROM 
    cliente c
JOIN 
    venda v ON c.id_cliente = v.id_cliente
GROUP BY 
    c.nome_cliente
ORDER BY 
    SUM(v.valor_venda) DESC;
-- exercicio 6 --
    SELECT 
    c.nome_cliente AS CLIENTE,
    COUNT(v.id_venda) AS VENCIDOS
FROM 
    cliente c
JOIN 
    venda v ON c.id_cliente = v.id_cliente
WHERE 
    v.data_venda < '2003-12-31'
GROUP BY 
    c.nome_cliente
ORDER BY 
    VENCIDOS DESC;
    
	-- exercicio 7 --
SELECT 
    c.nome_cliente AS CLIENTE,
    v.valor_venda AS VALOR_DUPLICATA,
    (v.valor_venda * 0.10) AS VALOR_JUROS,
    (v.valor_venda * 1.10) AS TOTAL_A_COBRAR
FROM 
    cliente c
JOIN 
    venda v ON c.id_cliente = v.id_cliente
WHERE 
    v.data_venda < '1999-12-31'
ORDER BY 
    c.nome_cliente;
    





