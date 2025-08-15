create database solar;

use solar;

Create table if not exists clientes (
Cod_cliente int not null,
nome_cliente varchar(100),
CPF varchar(14) not null,
endereco varchar(100),
celular varchar(19),
primary key (cod_cliente)
);

create table if not exists fornecedor (
cod_fornecedor int not null,
nome_fornecedor varchar(255),
CNPJ varchar(18) not null,
estado char(2) default'SP' not null,
cidade varchar(100) not null,
endereco varchar(100) not null,
primary key (cod_fornecedor)
);

create table produto (
cod_produto int auto_increment not null,
nome_produto varchar(100) not null,
descricao varchar(100),
Qtde int not null,
valor decimal(5,2) not null,
primary key (cod_produto)
);

create table venda (
cod_venda int primary key auto_increment not null,
cod_produto int not null,
cod_fornecedor int not null,
foreign key (cod_produto) references produto (cod_produto),
foreign key (cod_fornecedor) references fornecedor (cod_fornecedor),
salario decimal(7,2) not null
);

create table departamento (
cod_departamento int primary key auto_increment not null,
nome_departamento varchar(100) not null,
endereco varchar(100)
);

create table funcionario (
cod_funcionario int primary key auto_increment not null,
Nome_funcionario varchar(100) not null,
cpf_funcionario varchar(14),
celular int not null,
idade int not null,
cargo varchar(50)
);


alter table funcionario
add sexo char(1);

alter table funcionario
drop column sexo;

alter table funcionario
rename to empregado;

alter table empregado
modify column nome_funcionario varchar(200);

alter table empregado
modify column estado char(2) default 'MG';

alter table empregado
add primary key (cpf_funcionario);
