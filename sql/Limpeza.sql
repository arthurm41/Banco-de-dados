create database limpeza;

use limpeza;

CREATE TABLE produtos (
    Id_produto INT PRIMARY KEY,
    Valor DECIMAL,
    Quantidade INT,
    Descricao VARCHAR(255),
    Nome VARCHAR(100)
);

CREATE TABLE estoque (
    Id_estoque INT PRIMARY KEY,
    Quantidade INT,
    Setor VARCHAR(100),
    Nome VARCHAR(100),
    Observacao VARCHAR(255)
);

CREATE TABLE clientes (
    Id_cliente INT PRIMARY KEY,
    Nome_cliente VARCHAR(100),
    CPF CHAR(14),
    Residencia VARCHAR(255),
    O_que_comprou TEXT
);

CREATE TABLE vendas (
    Id_vendas INT PRIMARY KEY,
    Tipo VARCHAR(50),
    Valor DECIMAL,
    Data_dia DATETIME,
    Observacao VARCHAR(255)
);

CREATE TABLE funcionarios (
    Id_funcionario INT PRIMARY KEY,
    Nome_funcionario VARCHAR(100),
    CPF CHAR(14),
    Cargo VARCHAR(100),
    Salario DECIMAL
);
