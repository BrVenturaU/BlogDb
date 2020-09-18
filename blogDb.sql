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
	id TINYINT IDENTITY PRIMARY KEY NOT NULL,
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

--BRANDON MANUEL VENTURA UMA�A - SMIS010919
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

--BRANDON MANUEL VENTURA UMA�A - SMIS010919
--Inserts tabla ValoracionPregunta
INSERT INTO ValoracionPregunta VALUES
	(1, 1, 1, 1, '', '16-09-2020');
GO

INSERT INTO ValoracionPregunta VALUES
	(2, 2, 1, 1, 'Ha sido de mucha utilidad', '16-09-2020');
GO

INSERT INTO ValoracionPregunta VALUES
	(2, 3, 1, 1, 'Ha resuelto mi problema', '16-09-2020');
GO

INSERT INTO ValoracionPregunta VALUES
	(4, 2, 2, 1, 'Ha ayudado pero cuesta entender', '16-09-2020');
GO

INSERT INTO ValoracionPregunta VALUES
	(2, 3, 2, 1, 'Me ha sido dificil entender', '16-09-2020');
GO

--BRANDON MANUEL VENTURA UMA�A - SMIS010919
--Agregando llaves f�raneas a ValoracionPregunta
ALTER TABLE ValoracionPregunta
	ADD FOREIGN KEY (idPregunta) REFERENCES Pregunta(id);
GO

ALTER TABLE ValoracionPregunta
	ADD FOREIGN KEY (idUsuario) REFERENCES Usuario(id);
GO

--**********************************************************************************************************************
--Wendy Azucena Solorzano Hernandez - SMIS010519

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

--Agregando claves externas a la tabla Comentario
ALTER TABLE Comentario 
	ADD FOREIGN KEY (idUsuario) REFERENCES Usuario(id);
	
ALTER TABLE Comentario 
	ADD FOREIGN KEY (idPublicacion) REFERENCES Publicacion(id);
GO

--Insertando datos en tabla Comentario
INSERT INTO Comentario VALUES
	(1, 1, 'Muy buena informaci�n', 1, '17-08-2020');

INSERT INTO Comentario VALUES
	(1, 2, 'Las caracteristicas del tema estan erroneas', 0, '15-01-2015');

INSERT INTO Comentario VALUES
	(3, 3, 'Excelente', 0, '25-02-2018');

INSERT INTO Comentario VALUES
	(4, 1, 'Donde estan sus redes sociales...', 1, '06-11-2019');

INSERT INTO Comentario VALUES
	(5, 2, 'La mejor informacion que encontre, Gracias!', 1, '07-11-1019');
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

--Agregando claves externas a la tabla ValoracionComentario
ALTER TABLE ValoracionComentario 
	ADD FOREIGN KEY (idComentario) REFERENCES Comentario(id);

ALTER TABLE ValoracionComentario
	ADD FOREIGN KEY (idUsuario) REFERENCES Usuario(id);
GO

--Insertando datos en tabla ValoracionComentario
INSERT INTO ValoracionComentario VALUES
	(1, 1, 1, '17-08-2020');

INSERT INTO ValoracionComentario VALUES
	(1, 2, 0, '15-01-2015');

INSERT INTO ValoracionComentario VALUES
	(5, 2, 1, '25-02-2018');

INSERT INTO ValoracionComentario VALUES
	(5, 3, 1, '06-11-2019');

INSERT INTO ValoracionComentario VALUES
	(3, 2, 1, '07-11-1019');
GO


--Wendy Azucena Solorzano Hernandez - SMIS010519

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

--Agregando claves externas a la tabla Pregunta
ALTER TABLE Pregunta
	ADD FOREIGN KEY (idCategoria) REFERENCES CategoriaPregunta(id);

--Insertando datos en tabla Pregunta
INSERT INTO Pregunta VALUES
	(1, 'Las TIC', '�Donde puedo aprender mas de ello?', 1, 'Tecnologia ')

INSERT INTO Pregunta VALUES
	(2, 'Las TIC', '�Quien invento el termino TIC?', 1, 'Tecnologia ')

INSERT INTO Pregunta VALUES
	(3, 'Sobre Matrices', '�En que se usan las matrices?', 1, 'Matematica')

INSERT INTO Pregunta VALUES
	(5, 'Metodos en C#', '�Que significa GET y SET en C#?', 1, 'Programacion')

INSERT INTO Pregunta VALUES
	(4, 'Formularios', '�Porque se borra todo el contenido del formario?', 1, 'Programacion')
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

INSERT INTO CategoriaPublicacion VALUES
	('Pelicula', 'Estrenos, chismes o rememorar peliculas',1);
GO

INSERT INTO CategoriaPublicacion VALUES
	('Comedia', 'Memes o chistes de stand up o cualquier tipo',1 );
GO

 INSERT INTO CategoriaPublicacion VALUES
	('Noticias', 'Engloba toda clase de noticias de economia,deporte,enfermedades y acontecimientos naturales',1);
GO

INSERT INTO CategoriaPublicacion VALUES
	('Noticias', 'Engloba toda clase de noticias de economia,deporte,enfermedades y acontecimientos naturales',1 );
GO

INSERT INTO CategoriaPublicacion VALUES
	('Videojuegos', 'Actualizaciones y DLC de nuevos o viejos videojuegos',1 );
GO

--Creacion de la tabla CategoriaPregunta
CREATE TABLE CategoriaPregunta(
	id TINYINT IDENTITY PRIMARY KEY NOT NULL,
	nombre NVARCHAR(50) NOT NULL,
	descripcion NVARCHAR(MAX),
	estado BIT NOT NULL
);
GO

INSERT INTO CategoriaPregunta VALUES
	('�Como Iniciar Sesion?', 'Obt�n informaci�n sobre c�mo iniciar sesi�n en tu cuenta',1);
GO

INSERT INTO CategoriaPregunta VALUES
	('�como registrarse?', 'Obt�n informaci�n sobre c�mo registrar tu cuenta',1);
GO

INSERT INTO CategoriaPregunta VALUES
	('�como puedo comentar en un blog?', 'Obt�n informaci�n sobre c�mo comentar un blog',1);
GO

INSERT INTO CategoriaPregunta VALUES
	('�Como cerrar mi cuenta definitivamente?', 'Obt�n informaci�n sobre c�mo comentar un blog',1);
GO

INSERT INTO CategoriaPregunta VALUES
	('�Como valorar un comentario?', 'Obt�n informaci�n sobre c�mo comentar un blog',1);
GO


--Creacion de la tabla Publicacion

CREATE TABLE Publicacion(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	idCategoria SMALLINT NOT NULL,
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

--Cristian Alexander Serrano Blanco
--Agregando llaves f�raneas a Publicacion

ALTER TABLE Publicacion
	ADD FOREIGN KEY (idUsuario) REFERENCES Usuario(id);
GO

ALTER TABLE Publicacion
	ADD FOREIGN KEY (idCategoria) REFERENCES CategoriaPublicacion(id);
GO


--Insertar datos en la tabla Publicacion
INSERT INTO Publicacion VALUES
	(1,1,'VALORANT EL NUEVO JUEGO COMPETITIVO', 'Encuentra todo lo que debes saber de la nueva sensaci�n
	en los eSport','Aqui tuviera que ir toda la publicidad y informacion de el juego pero como
	no quise buscarlo en la pagina mejor preferi escribir lo primero que se viniera a la cabeza gracias por 
	aver leido hasta aqu�, fue una bonita forma de perder tu tiempo. :) ', '16-09-2020', '16-09-2020',1);
GO

INSERT INTO Publicacion VALUES
	(1,1,'SE DESCUBRE FORMA MILAGROSA DE NO CONTRAR EL COVID DESCUBRELO AQUI...', 'Investigadores de Donald Trump aseguran la constante injesta de...','
	Este espacio es solo para decirte que es totalmente para que te distraigas y que leas esto aunque no quieras', '16-09-2020', '16-09-2020',1);
GO

INSERT INTO Publicacion VALUES
	(1,1,'ESTRENO, ESTRENO LA NUEVA PELICULA QUE REVOLUCIONAR� EL 2020', 'la pelicula tiene por titulo the sad little bee','
	Tu tandras el deber de descubrir porque esta triste solo en cines el 24 de septiembre', '16-09-2020', '16-09-2020',1);
GO
