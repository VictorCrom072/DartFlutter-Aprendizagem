drop database if exists dart;
create database dart;
use dart;

create table  usuarios (
  id int primary key auto_increment,
  nome varchar(255) not null,
  email varchar(255) not null,
  senha varchar(255) not null,
  dt_criacao datetime default current_timestamp
);

insert into usuarios values(default, 'Crom', 'cromatico@gmail.com', '1234', default);
insert into usuarios values(default, 'Kallex', 'Kallex072@gmail.com', '5678', default);

select * from usuarios;