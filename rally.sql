create database RallyDatabase;

use RallyDatabase;

CREATE TABLE Equipos (
	ID_Equipo int not null AUTO_INCREMENT,
    Matricula_E1 VARCHAR(15) NOT NULL,
    Matricula_E2 VARCHAR(15) NOT NULL,
    Matricula_E3 VARCHAR(15),
    Codigo_Grupo VARCHAR(20),
    primary key (ID_Equipo)    
);

create TABLE Estaciones (
    ID_Estacion int not null AUTO_INCREMENT,
    Nombre VARCHAR(20) not null,
    primary key(ID_Estacion)
);

create TABLE Usuarios (
    ID_Usuario int not null AUTO_INCREMENT,
    Nombre VARCHAR(200) not null,
    Username VARCHAR(100) not null,
    Pass_Usuario VARCHAR(100) not null,
    Estacion int not null,
    primary key (ID_Usuarios)
    Foreign Key (Estacion) References Estaciones(ID_Estacion)
);

CREATE TABLE Preguntas_Respuestas (
	ID_Pregunta INT not null AUTO_INCREMENT,
    Pregunta VARCHAR(250) not null,
    RES_Correcta VARCHAR(200),
    RES_INC1 VARCHAR(200),
    RES_INC2 VARCHAR(200),
    RES_INC3 VARCHAR(200),
    Estacion INT not null,
    primary key(ID_Pregunta),
    Foreign key (Estacion) References Estaciones(ID_Estacion)
);

create TABLE Reg_Resp(
    ID_Reg_Resp int not null AUTO_INCREMENT,
    Pregunta int not null,
    Respuesta int not null,/* valor de la respuesta si esta bien +5, si esta mal +0*/
    Equipo int not null, /* el equipo que respondio, ID*/
    primary key(ID_Reg_Resp),
    Foreign key(Pregunta) References PREGUNTAS_RESPUESTAS(ID_Pregunta),
    Foreign key(ID_Equipo) References REGISTRO_EQUIPOS(ID_Equipo)
);

create TABLE Reg_Time(
    ID_Reg_Time int not null AUTO_INCREMENT,
    Estacion int not null,
    Equipo int not null,
    Hora time not null,
    primary key(ID_Reg_Time),
    Foreign key(Estacion) References Estaciones(ID_Estacion),
    Foreign key(Equipo) References Equipos(ID_Equipo)
);