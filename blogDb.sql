--BRANDON MANUEL VENTUTA UMA�A - SMIS010919
--Creando la base de datos BlogDb
CREATE DATABASE BlogDb;
USE BlogDb;
GO

--Configurando el formato de la fecha para la sesi�n
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

--BRANDON MANUEL VENTURA UMA�A - SMIS010919
--Inserts tabla Usuario
INSERT INTO Usuario VALUES
	('Brandon', 'Manuel', 'Ventura', 'Uma�a', 'brandonventura16@gmail.com',
	'brandon2020', 'holaMundo1234', '16-09-2020', 'AD');
GO
INSERT INTO Usuario VALUES
	('Wendy', 'Azucena', 'Sol�rzano', 'Hern�ndez', 'hwendy750@gmail.com',
	'wendy2020', 'holaMundo1234', '16-09-2020', 'AD');
GO
INSERT INTO Usuario VALUES
	('Cristian', 'Alexander', 'Serrano', 'Blanco', 'asbcrit@gmail.com',
	'cristian2020', 'holaMundo1234', '16-09-2020', 'AD');
GO
INSERT INTO Usuario VALUES
	('Isis', 'F�nix', 'Benitez', 'Ventura', 'isisfenix@gmail.com',
	'fenix2020', 'holaMundo1234', '16-09-2020', 'CM');
GO
INSERT INTO Usuario VALUES
	('Rosa', 'Maria', 'Velazquez', 'Romero', 'rosa20@gmail.com',
	'maria2020', 'holaMundo1234', '16-09-2020', 'CM');
GO

--BRANDON MANUEL VENTURA UMA�A - SMIS010919
--Creando tabla TipoValoracion
CREATE TABLE TipoValoracion(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	nombre NVARCHAR(150) NOT NULL, 
	descripcion NVARCHAR(200),
	estado BIT
);
GO

--BRANDON MANUEL VENTURA UMA�A - SMIS010919
--Inserts tabla TipoValoracion
INSERT INTO TipoValoracion VALUES
	('La soluci�n fue de ayuda', 'La informaci�n del FAQ solucion� la duda del usuario',
	 1);
GO
INSERT INTO TipoValoracion VALUES
	('La informaci�n es confusa', 'La informaci�n del FAQ result� confusa para el usuario',
	1);
GO
INSERT INTO TipoValoracion VALUES
	('La soluci�n no funciona', 'La informaci�n del FAQ no funcion� para el usuario',
	1);
GO
INSERT INTO TipoValoracion VALUES
	('No me gusta el producto ni la pol�tica',
	 'La informaci�n del FAQ no concuerda con los gustos del usuario', 1);
GO
INSERT INTO TipoValoracion VALUES
	('Otro',
	 'La informaci�n del FAQ le di� otras ideas al usuario', 1);
GO
