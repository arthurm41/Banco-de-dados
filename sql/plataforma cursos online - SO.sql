create database plataforma_cursos_online;

use plataforma_cursos_online;

create table alunos (
    aluno_id int auto_increment primary key,
    nome_aluno varchar(100),
    email varchar(100) not null,
    data_nascimento date
);

create table cursos (
    curso_id int auto_increment primary key,
    titulo varchar(100),
    descricao varchar(100),
    carga_horaria int,
    status_curso varchar(100) not null
);

create table inscricoes (
    id_incricoes int auto_increment primary key,
    aluno_id int,
    curso_id int,
    foreign key (aluno_id) references alunos(aluno_id),	
    foreign key (curso_id) references cursos(curso_id),
    data_criacao datetime
);

create table avaliacoes (
    avaliacao_id int auto_increment primary key,
    id_incricoes int,
    foreign key (id_incricoes) references inscricoes(id_incricoes),
    nota decimal(3,1),
    comentario varchar(255)
);

-- parte 3
insert into alunos (nome_aluno, email, data_nascimento) values
('gustavo lima', 'gusta54@email.com', '2001-09-11'),
('mohammed alli', 'alli13@email.com', '2007-09-20'),
('ednaldo pereira', 'ednaldo131@email.com', '1996-02-29'),
('paulo guina', 'paulog01@email.com', '2008-04-30'),
('ronaldo silva', 'silva412@email.com', '2009-09-19');

insert into cursos (titulo, descricao, carga_horaria, status_curso) values
('introdução ao sql', 'curso básico de sql e bancos de dados relacionais', 20, 'ativo'),
('desenvolvimento web', 'fundamentos de html, css e javascript', 40, 'ativo'),
('python para iniciantes', 'curso introdutório de programação em python', 30, 'ativo'),
('machine learning', 'conceitos e práticas de aprendizado de máquina', 50, 'ativo'),
('photoshop avançado', 'edição e manipulação de imagens', 25, 'inativo');

insert into inscricoes (aluno_id, curso_id, data_criacao) values
(1, 1, now()), 
(2, 2, now()), 
(3, 3, now()), 
(4, 4, now()), 
(5, 1, now());

insert into avaliacoes (id_incricoes, nota, comentario) values
(1, 9.0, 'muito bom.'),
(2, 7.0, 'é bom, mas falta coisa.'),
(3, 6.0, 'achei simples.');

-- parte 4
update alunos
set email = 'mohamed19@gmail.com'
where nome_aluno = 'mohammed alli';

update cursos
set carga_horaria = 40
where titulo = 'photoshop avançado';

update alunos
set nome_aluno = 'mohamed alli'
where nome_aluno = 'mohammed alli';

update cursos
set status_curso = 'ativo'
where titulo = 'photoshop avançado';

update avaliacoes
set nota = 9.5
where avaliacao_id = 2;

-- parte 5
delete from inscricoes
where id_incricoes = 3;

delete from cursos
where curso_id = 5;

delete from avaliacoes
where avaliacao_id = 2;

delete from alunos
where aluno_id = 4;

delete from inscricoes
where curso_id = 5;

-- parte 6
select * from alunos;

select nome_aluno, email from alunos;

select * from cursos
where carga_horaria > 30;

select * from cursos
where status_curso = 'inativo';

select * from alunos
where data_nascimento > '1995-12-31';

select * from avaliacoes
where nota > 9;

select count(*) as total_cursos from cursos;

select * from cursos
order by carga_horaria desc
limit 3;

-- extra
create index idx_alunos_email
on alunos(email);

select * from alunos
where email = 'gusta54@email.com';
