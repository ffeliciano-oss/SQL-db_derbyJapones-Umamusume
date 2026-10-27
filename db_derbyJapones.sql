create database if not exists db_derbyJapones;
use db_derbyJapones;

create table umamusume(
	id_uma int auto_increment primary key,
    nome_uma varchar(50) not null,
    aptitude varchar(30) not null,
    estilo_corrida varchar(20) not null,
    treinador varchar(50) NULL
);

create table pista_Corrida(
	id_pista int auto_increment primary key,
    nome_pista varchar(50) not null,
    tamanho varchar(50) not null,
    solo varchar(20) not null,
    classificacao varchar(10) not null,
    data_ocorrencia date not null,
    corredores_max int not null
);

create table corrida(
	id_corrida int auto_increment primary key,
    id_pista int not null,
    id_uma
);