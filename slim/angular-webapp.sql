CREATE DATABASE IF NOT EXISTS librosU;
USE librosU;

CREATE TABLE libros(
id       int(255) auto_increment not null,
nombre   varchar(255),
descripcion TEXT,
imagen   varchar(255),
carrera  varchar(255),
CONSTRAINT pk_restaurantes PRIMARY KEY(id)
)ENGINE=InnoDb;