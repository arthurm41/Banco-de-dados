create database remoterc;

use remoterc;

create table produtos (
    cprod int primary key auto_increment not null,
    descricao varchar(255),
    peso varchar(10) not null,
    valorunit decimal(10,2)
);

insert into produtos (cprod, descricao, peso, valorunit)
values
(1, 'teclado', 'kg', 35.00),
(2, 'mouse', 'kg', 25.00),
(3, 'hd', 'kg', 350.00);

create table vendedor (
    cvend int primary key,
    nome varchar(255) not null,
    salario decimal(10,2) not null,
    fsalario int not null
);

insert into vendedor (cvend, nome, salario, fsalario)
values
(1, 'ronaldo', 3512.00, 1),
(2, 'robertson', 3225.00, 2),
(3, 'clodoaldo', 4350.00, 3);

create table cliente (
    ccli int primary key,
    nome varchar(255) not null,
    endereco varchar(255) not null,
    cidade varchar(100) not null,
    uf char(2) not null
);

insert into cliente (ccli, nome, endereco, cidade, uf)
values
(11, 'bruno', 'rua 1 456', 'rio claro', 'sp'),
(12, 'cláudio', 'rua quadrada 234', 'campinas', 'sp'),
(13, 'cremilda', 'rua das flores 666', 'são paulo', 'sp');
