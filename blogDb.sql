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

--BRANDON MANUEL VENTURA UMAÑA - SMIS010919
--Creando tabla TipoValoracion
CREATE TABLE TipoValoracion(
	id TINYINT IDENTITY PRIMARY KEY NOT NULL,
	nombre NVARCHAR(150) NOT NULL, 
	descripcion NVARCHAR(200),
	estado BIT
);
GO

--BRANDON MANUEL VENTURA UMAÑA - SMIS010919
--Inserts tabla TipoValoracion
INSERT INTO TipoValoracion VALUES
	('La solución fue de ayuda', 'La información del FAQ solucionó la duda del usuario',
	 1);
GO
INSERT INTO TipoValoracion VALUES
	('La información es confusa', 'La información del FAQ resultó confusa para el usuario',
	1);
GO
INSERT INTO TipoValoracion VALUES
	('La solución no funciona', 'La información del FAQ no funcionó para el usuario',
	1);
GO
INSERT INTO TipoValoracion VALUES
	('No me gusta el producto ni la política',
	 'La información del FAQ no concuerda con los gustos del usuario', 1);
GO
INSERT INTO TipoValoracion VALUES
	('Otro',
	 'La información del FAQ le dió otras ideas al usuario', 1);
GO

--BRANDON MANUEL VENTURA UMAÑA - SMIS010919
--Creando tabla ValoracionPregunta
CREATE TABLE ValoracionPregunta(
	idUsuario INT NOT NULL,
	idPregunta INT NOT NULL,
	idTipoValoracion TINYINT FOREIGN KEY REFERENCES TipoValoracion(id),
	esUtil BIT,
	comentario NVARCHAR(280),
	fechaCreacion DATETIME CHECK(fechaCreacion <= GETDATE()),
	PRIMARY KEY (idUsuario, idPregunta)
);
GO

--BRANDON MANUEL VENTURA UMAÑA - SMIS010919
--Agregando llaves fóraneas a ValoracionPregunta
ALTER TABLE ValoracionPregunta
	ADD FOREIGN KEY (idPregunta) REFERENCES Pregunta(id);
GO

ALTER TABLE ValoracionPregunta
	ADD FOREIGN KEY (idUsuario) REFERENCES Usuario(id);
GO

--Wendy Azucena Solorzano Hernandez ***SMIS010519

--Creacion de tablas:

--Tabla - Comentario
CREATE TABLE Comentario
(
	id INT IDENTITY NOT NULL PRIMARY KEY, 
	idUsuario INT NOT NULL, 
	idPublicacion INT NOT NULL,
	comentario NVARCHAR(MAX),
	estado BIT NOT NULL,
	fechaCreacion DATETIME CHECK (fechaCreacion <= GETDATE()),
);
GO

--Tabla - Valoracion de Comentario
CREATE TABLE ValoracionComentario
(
	idComentario INT NOT NULL,
	idUsuario INT NOT NULL, 
	esUtil BIT,
	fechaCreacion DATETIME CHECK (fechaCreacion <= GETDATE()),
	PRIMARY KEY(idUsuario, idComentario)
);
GO


--TABLA - Pregunta
CREATE TABLE Pregunta
(
	id INT IDENTITY NOT NULL PRIMARY KEY,
	idCategoria TINYINT NOT NULL, 
	titulo NVARCHAR(200),
	descripcion NVARCHAR(MAX),
	estado BIT NOT NULL,
	etiqueta NVARCHAR(MAX)
);
GO

--Cristian Alexander Serrano Blanco

--Creacion de la tabla CategoriaPublicacion
CREATE TABLE CategoriaPublicacion(
	id SMALLINT IDENTITY PRIMARY KEY NOT NULL,
	nombre NVARCHAR(30) NOT NULL,
	descripcion NVARCHAR(MAX),
	estado BIT NOT NULL,
	imagen NVARCHAR(MAX)
);
GO

--Creacion de la tabla CategoriaPregunta
CREATE TABLE CategoriaPregunta(
	id TINYINT IDENTITY PRIMARY KEY NOT NULL,
	nombre NVARCHAR(50) NOT NULL,
	descripcion NVARCHAR(MAX),
	estado BIT NOT NULL
);
GO


--Creacion de la tabla Publicacion

CREATE TABLE Publicacion(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	idCategoria INT NOT NULL,
	idUsuario INT NOT NULL,
	titulo NVARCHAR(150) NOT NULL,
	cabecera NVARCHAR(MAX) NOT NULL,
	cuerpo NVARCHAR(MAX) NOT NULL,
	fechaCreacion DATETIME CHECK(fechaCreacion <= GETDATE()),
	fechaModificacion DATETIME CHECK(fechaModificacion <= GETDATE()),
	estado BIT NOT NULL,
	imagen NVARCHAR(MAX),
);
GO
