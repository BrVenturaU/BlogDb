--BRANDON MANUEL VENTUTA UMAÑA - SMIS010919
--Creando la base de datos BlogDb
CREATE DATABASE BlogDb;
USE BlogDb;
GO

--Configurando el formato de la fecha para la sesión
SET DATEFORMAT dmy;
GO

--Creando tabla Usuario
CREATE TABLE Usuario(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	primerNombre NVARCHAR(20) NOT NULL,
	segundoNombre NVARCHAR(20),
	primerApellido NVARCHAR(20) NOT NULL,
	segundoApellido NVARCHAR(20),
	email NVARCHAR(100) NOT NULL UNIQUE,
	codigoUsuario NVARCHAR(20) NOT NULL UNIQUE,
	userPassword NVARCHAR(MAX) NOT NULL,
	fechaCreacion DATETIME CHECK(fechaCreacion <= GETDATE()),
	tipo CHAR(2) NOT NULL
);
GO

--BRANDON MANUEL VENTURA UMAÑA - SMIS010919
--Inserts tabla Usuario
INSERT INTO Usuario VALUES
	('Brandon', 'Manuel', 'Ventura', 'Umaña', 'brandonventura16@gmail.com',
	'brandon2020', 'holaMundo1234', '16-09-2020', 'AD');
GO
INSERT INTO Usuario VALUES
	('Wendy', 'Azucena', 'Solórzano', 'Hernández', 'hwendy750@gmail.com',
	'wendy2020', 'holaMundo1234', '16-09-2020', 'AD');
GO
INSERT INTO Usuario VALUES
	('Cristian', 'Alexander', 'Serrano', 'Blanco', 'asbcrit@gmail.com',
	'cristian2020', 'holaMundo1234', '16-09-2020', 'AD');
GO
INSERT INTO Usuario VALUES
	('Isis', 'Fénix', 'Benitez', 'Ventura', 'isisfenix@gmail.com',
	'fenix2020', 'holaMundo1234', '16-09-2020', 'CM');
GO
INSERT INTO Usuario VALUES
	('Rosa', 'Maria', 'Velazquez', 'Romero', 'rosa20@gmail.com',
	'maria2020', 'holaMundo1234', '16-09-2020', 'CM');
GO
