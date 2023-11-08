drop database if exists dart;
CREATE SCHEMA `dart` DEFAULT CHARACTER SET utf8;
USE `dart`;

CREATE TABLE IF NOT EXISTS usuarios (
  id INT primary key AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  dt_criacao datetime DEFAULT CURRENT_TIMESTAMP
);

insert into usuarios values(default, 'Crom', 'cromatico@gmail.com', '1234', default);
insert into usuarios values(default, 'Kallex', 'Kallex072@gmail.com', '5678', default);

select * from usuarios;