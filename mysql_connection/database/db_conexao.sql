drop database if exists db_api;
create database db_api;
use db_api;

create table tb_usuario
(
	id_usu int primary key auto_increment,
	nome_usu varchar(80) not null,
	email_usu varchar(80) not null,
	senha_usu varchar(20) not null
);

insert into tb_usuario values (default, 'kallex', 'kallex@gmail.com', '1234');

select * from tb_usuario;