CREATE TABLE USUARIOS (
ID_USUARIO INTEGER PRIMARY KEY AUTO_INCREMENT,
COD_USUARIO VARCHAR(20),
PASSWORD VARCHAR(10),
NOMBRE VARCHAR(100),
APELLIDO1 VARCHAR(100),
APELLIDO2 VARCHAR(100),
ID_ROL INTEGER,
ES_BAJA VARCHAR(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19) DEFAULT NULL,
FECHA_MODIF VARCHAR(19)
);

INSERT INTO USUARIOS (COD_USUARIO,PASSWORD,NOMBRE,APELLIDO1,APELLIDO2,ID_ROL,FECHA_MODIF)
VALUES
('CALCENA','1234','DAVID','CALCENA','CASTRO',1,'2018-07-01');



CREATE TABLE ROLES (
ID_ROL INTEGER PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(25),
ID_PERMISO INTEGER,
ES_BAJA varchar(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19) DEFAULT NULL,
FECHA_MODIF VARCHAR(19)
);



INSERT INTO ROLES (NOMBRE,ID_PERMISO, FECHA_MODIF)
VALUES
('SUPER USUARIO',1,'26/07/2018'),
('ADMINISTRADOR',2,'26/07/2018'),
('SUPERVISOR',3,'26/07/2018'),
('USUARIO',4,'26/07/2018');




CREATE TABLE PERMISOS (
ID_PERMISO INTEGER PRIMARY KEY AUTO_INCREMENT,
MENU_HORARIOS VARCHAR(1),
MENU_VACACIONES VARCHAR(1),
MENU_LOGS VARCHAR(1),
MENU_PROYECTOS VARCHAR(1),
MENU_PROYECTOS_ADD VARCHAR(1),
MENU_PROYECTOS_EDIT VARCHAR(1),
MENU_PROYECTOS_DEL VARCHAR(1),
MENU_PROYECTOS_FILTER VARCHAR(1),
MENU_USUARIOS VARCHAR(1),
MENU_USUARIOS_ADD VARCHAR(1),
MENU_USUARIOS_EDIT VARCHAR(1),
MENU_USUARIOS_DEL VARCHAR(1),
MENU_USUARIOS_FILTER VARCHAR(1),
MENU_SISTEMA VARCHAR(1),
MENU_INFORMES VARCHAR(1)
);

CREATE TABLE CLIENTES(
ID_CLIENTE INTEGER PRIMARY KEY AUTO_INCREMENT,
COD_CLIENTE VARCHAR(12),
NOMBRE VARCHAR(255),
DIRECCION VARCHAR(2000),
COD_POSTAL VARCHAR(5),
POBLACION VARCHAR(255),
PROVINCIA VARCHAR(100),
TELF_CONTACTO1 VARCHAR(15) DEFAULT NULL,
TELF_CONTACTO2 VARCHAR(15) DEFAULT NULL,
CORREO VARCHAR(100) DEFAULT NULL,
ES_BAJA VARCHAR(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19) DEFAULT NULL,
FECHA_MODIF VARCHAR(19)
);

/*     */
INSERT INTO CLIENTES (COD_CLIENTE,NOMBRE,DIRECCION,COD_POSTAL,POBLACION,PROVINCIA, FECHA_MODIF)
VALUES
('CLI-00001/18','CLIENTE1','UNA CUALQUIERA','08349','VILASSAR DE MAR','BARCELONA','26/07/2018'),
('CLI-00002/18','CLIENTE2','UNA CUALQUIERA','08349','VILASSAR DE MAR','BARCELONA','26/07/2018'),
('CLI-00003/18','CLIENTE3','UNA CUALQUIERA','08349','VILASSAR DE MAR','BARCELONA','26/07/2018'),
('CLI-00004/18','CLIENTE4','UNA CUALQUIERA','08349','VILASSAR DE MAR','BARCELONA','26/07/2018'),
('CLI-00005/18','CLIENTE5','UNA CUALQUIERA','08349','VILASSAR DE MAR','BARCELONA','26/07/2018');



CREATE TABLE PROYECTOS (
ID_PROYECTO INTEGER PRIMARY KEY AUTO_INCREMENT,
ID_CLIENTE INTEGER,
COD_PROYECTO VARCHAR(12),
DESCRIPCION VARCHAR(255),
HORAS_ESTIMADAS DECIMAL,
HORAS_IMPUTADAS DECIMAL DEFAULT	 0,
ES_CERRADO VARCHAR(1) DEFAULT '-',
ES_BAJA VARCHAR(1) DEFAULT '-',
MOTIVO_BAJA VARCHAR(2000) DEFAULT NULL,
FECHA_BAJA VARCHAR(19) DEFAULT NULL,
FECHA_MODIF VARCHAR(19)
);

INSERT INTO PROYECTOS (ID_CLIENTE,COD_PROYECTO,DESCRIPCION,HORAS_ESTIMADAS,FECHA_MODIF)
VALUES
(1,'PRO-00001/18','Transformación digital Fase 1',400,'26/07/2018'),
(1,'PRO-00002/18','Integración de WebServices',200,'26/07/2018'),
(1,'PRO-00003/18','Desarrollo de conector con DB Oracle',350,'26/07/2018'),
(1,'PRO-00004/18','Integración de Capa intermedia',850,'26/07/2018'),
(1,'PRO-00005/18','Mapeador de campos DB',650,'26/07/2018'),
(1,'PRO-00006/18','Desarrollo de Stored Procedures Fase 2',1000,'26/07/2018'),
(2,'PRO-00001/18','Digitalización de Capas',200,'26/07/2018'),
(2,'PRO-00002/18','Transformación digital Fase 4',1800,'26/07/2018'),
(2,'PRO-00003/18','Integración con SOAP',830,'26/07/2018'),
(2,'PRO-00004/18','Integración con KOFAX',300,'26/07/2018'),
(2,'PRO-00005/18','Herramienta de almacenamiento de imágenes',600,'26/07/2018'),
(2,'PRO-00006/18','Gestor de Proyectos',710,'26/07/2018');


CREATE TABLE PROY_USER(
ID_PROY_USER INTEGER PRIMARY KEY AUTO_INCREMENT,
ID_PROYECTO INTEGER,
ID_USUARIO INTEGER
);

CREATE TABLE REQUERIMIENTOS(
ID_REQUERIMIENTO INTEGER PRIMARY KEY AUTO_INCREMENT,
ID_PROYECTO INTEGER,
COD_REQUERIMIENTO VARCHAR(12),
DESCRIPCION VARCHAR(255),
RUTA VARCHAR(1000),
ES_BAJA VARCHAR(1) DEFAULT '-',
ES_CERRADO VARCHAR(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19) DEFAULT NULL,
FECHA_CERRADO VARCHAR(19) DEFAULT NULL,
FECHA_MODIF VARCHAR(19)
);

INSERT INTO REQUERIMIENTOS(ID_PROYECTO,COD_REQUERIMIENTO,DESCRIPCION,RUTA,FECHA_MODIF)
VALUES
(1,'REQ-00001/18','Funcional de Software','localhost','28/07/2018'),
(1,'REQ-00002/18','Funcional de Software','localhost','28/07/2018'),
(2,'REQ-00003/18','Funcional de Software','localhost','28/07/2018'),
(2,'REQ-00004/18','Funcional de Software','localhost','28/07/2018');




CREATE TABLE TAREAS (
ID_TAREA INTEGER PRIMARY KEY AUTO_INCREMENT,
ID_USUARIO INTEGER,
ID_PROYECTO INTEGER,
ID_REQUERIMIENTO INTEGER,
COD_TAREA VARCHAR(12),
DESCRIPCION VARCHAR(2000),
HORAS DECIMAL,
FECHA_ENTREGA VARCHAR(10),
PRIORIDAD INTEGER, -- (1) CRITICA - (2) ALTA - (3) MEDIA - (4) BAJA
ASIGNADA VARCHAR(1) DEFAULT '-',
ES_BAJA VARCHAR(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19) DEFAULT NULL,
FECHA_MODIF VARCHAR(19)
);

CREATE TABLE LOGS (
ID_LOG INTEGER PRIMARY KEY AUTO_INCREMENT,
FECHA VARCHAR(10),
HORA VARCHAR(8),
PANTALLA VARCHAR(100),
MENSAJE VARCHAR(2000),
ESTADO VARCHAR(1), -- 1 OK / 2 KO / 3 WARNING / 4 CRITICAL
ES_BAJA VARCHAR(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19 )DEFAULT NULL
);

CREATE TABLE CALENDARIOS (
ID_CALENDARIO INTEGER PRIMARY KEY AUTO_INCREMENT,
ANYO INTEGER,
SEMANA INTEGER,
MES INTEGER,
DIA INTEGER
);

CREATE TABLE HORARIOS (
ID_HORARIO INTEGER PRIMARY KEY AUTO_INCREMENT,
ID_USUARIO INTEGER,
ID_CALENDARIO INTEGER,
D1 INTEGER,
D2 INTEGER,
D3 INTEGER,
D4 INTEGER,
D5 INTEGER,
D6 INTEGER,
D7 INTEGER,
ES_BAJA VARCHAR(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19) DEFAULT NULL
);

CREATE TABLE IMPUTACIONES (
ID_IMPUTACION INTEGER PRIMARY KEY AUTO_INCREMENT,
ID_USUARIO INTEGER,
ID_CALENDARIO INTEGER,
ID_TAREA INTEGER,
HORAS DECIMAL,
DESCRIPCION VARCHAR(2000),
ES_BAJA VARCHAR(1) DEFAULT '-',
FECHA_BAJA VARCHAR(19) DEFAULT NULL,
FECHA_MODIF VARCHAR (19)
);

/*   TODO PENDIENTE DE CONTROLAR LA LOGICA DE NEGOCIO */
/*
CREATE TABLE FESTIVOS (
ID_FESTIVO INTEGER PRIMARY KEY AUTO_INCREMENT,
ID_USUARIO INTEGER,
DIA INTEGER,
MES INTEGER,
.....
)


-- INSERTS EN EL SISTEMA MIGRACION

