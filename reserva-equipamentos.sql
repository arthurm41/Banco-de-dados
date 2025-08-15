create database reserva_equipamentos;
use reserva_equipamentos;

create table equipamento (
    id_equipamento int primary key auto_increment,
    nome varchar(100) not null,
    categoria varchar(50),
    quantidade_total int not null,
    descricao varchar(254)
);

create table usuario (
    id_usuario int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    telefone varchar(20),
    setor varchar(50)
);

create table reserva (
    id_reserva int primary key auto_increment,
    data_reserva datetime default current_timestamp,
    data_inicio datetime not null,
    data_fim datetime not null
);
