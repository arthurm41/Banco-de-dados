CREATE DATABASE atividade_avaliativa;
USE atividade_avaliativa;

CREATE TABLE Fornecedor (
    Cod_fornecedor INT PRIMARY KEY,
    Nome_fornecedor VARCHAR(255) NOT NULL,
    Status VARCHAR(255),
    Cidade VARCHAR(255)
);

CREATE TABLE Peca (
    Cod_peca INT PRIMARY KEY,
    Nome_peca VARCHAR(255) NOT NULL,
    Cor VARCHAR(255),
    Peso VARCHAR(255),
    Cidade VARCHAR(255)
);

CREATE TABLE Instituicao (
    Cod_instituicao INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

CREATE TABLE Projeto (
    Cod_projeto INT PRIMARY KEY,
    Nome_projeto VARCHAR(255) NOT NULL,
    Cidade VARCHAR(255),
    Cod_instituicao INT,
    FOREIGN KEY (Cod_instituicao) REFERENCES Instituicao(Cod_instituicao)
);

CREATE TABLE Fornecedor (
    Fcod INT,
    Pcod INT,
    PRcod INT,
    Qtde VARCHAR(255),
    PRIMARY KEY (Fcod, Pcod, PRcod)
);
