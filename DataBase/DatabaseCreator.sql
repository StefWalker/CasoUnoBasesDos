USE [master]

IF DB_ID('CasoBases') IS NULL
  BEGIN
	CREATE DATABASE CasoBases
  END
ELSE
  BEGIN
	DROP DATABASE CasoBases
	CREATE DATABASE CasoBases
  END

USE [CasoBases]
GO
CREATE TABLE Parties(
	IdPartido INT PRIMARY KEY IDENTITY(1,1), 
	Nombre VARCHAR(32) NOT NULL, 
	UrlFlag VARCHAR(256) NOT NULL, 
	CreationDate DATE NOT NULL
)

CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(32) NOT NULL,
	Apellidos VARCHAR(32) NOT NULL,
	Contrasenna VARCHAR(32) NOT NULL,
	UrlPicture VARCHAR(256) NOT NULL,
	CreationDate DATE NOT NULL,
	IdPartido INT NOT NULL,
	FOREIGN KEY(IdPartido) REFERENCES Parties(IdPartido)
)

CREATE TABLE Provincia(
	IdProvincia INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(32) NOT NULL
)

CREATE TABLE Cantones(
	IdCanton INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(32) NOT NULL,
	IdProvincia INT NOT NULL,
	FOREIGN KEY(IdProvincia) REFERENCES Provincia(IdProvincia)
)

CREATE TABLE Plans(
	IdPlan INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(256) NOT NULL,
	IdPartido INT NOT NULL,
	FOREIGN KEY(IdPartido) REFERENCES Parties(IdPartido)
)

CREATE TABLE Actions(
	IdAction INT PRIMARY KEY IDENTITY(1,1),
	IdPlan INT NOT NULL,
	Descripcion VARCHAR(256) NOT NULL,
	FOREIGN KEY(IdPlan) REFERENCES Plans(IdPlan)
)

CREATE TABLE Deliverables(
	IdDeliverable INT PRIMARY KEY IDENTITY(1,1),
	IdAction INT NOT NULL,
	IdCanton INT NOT NULL,
	KpiValue INT NOT NULL,
	KpiType INT NOT NULL,
	Posttime DATE NOT NULL,
	CheckSuma INT NOT NULL,
	FOREIGN KEY(IdAction) REFERENCES Actions(IdAction),
	FOREIGN KEY(IdCanton) REFERENCES Cantones(IdCanton)
)

INSERT INTO Provincia(
	Nombre)
VALUES
('San Jose'),
('Alajuela'),
('Cartago'),
('Guanacaste'),
('Heredia'),
('Limon'),
('Puntarenas');

INSERT INTO Parties(
	Nombre,
	UrlFlag,
	CreationDate)
Values
('PLN',
'https://upload.wikimedia.org/wikipedia/commons/a/ad/Bandera_de_Partido_Liberaci%C3%B3n_Nacional.svg',
'5/5/1982'),
('PAC',
'https://upload.wikimedia.org/wikipedia/commons/4/45/Bandera_Partido_Acci%C3%B3n_Ciudadana_Costa_Rica.svg',
'5/5/2000'),
('PUSC',
'https://upload.wikimedia.org/wikipedia/commons/a/ad/Bandera_del_Partido_Unidad_Social_Cristiana.svg',
'5/5/1998'),
('PIN',
'https://upload.wikimedia.org/wikipedia/commons/1/1e/Bandera_Partido_Integraci%C3%B3n_Nacional_Costa_Rica.svg',
'5/5/1998');

INSERT INTO Usuarios(
	Nombre,
	Apellidos,
	Contrasenna,
	UrlPicture,
	CreationDate,
	IdPartido
)
VALUES
('Guillermo',
'Constenla Umaña',
'Guille21',
'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Guillermo_Constenla_Uma%C3%B1a.png/640px-Guillermo_Constenla_Uma%C3%B1a.png',
'2/25/2022',
1),
('Welmer',
'Ramos González',
'Welm22',
'https://www.elfinancierocr.com/resizer/UnviVckC0LHq63lKzobx3g-r1ow=/1440x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/gruponacion/SE5TZPCOWVDNDJLWQFA6YYE32A.JPG',
'2/25/2022',
2),
('Randall',
'Quiros Bustamante',
'Rand23',
'https://pbs.twimg.com/profile_images/1240968539558875136/aocZlMLm_400x400.jpg',
'2/25/2022',
3),
('Walter',
'Munnoz Cespedes',
'Walt24',
'https://upload.wikimedia.org/wikipedia/commons/9/93/Walter-muoz-cespedes_41148244525_o.jpg',
'2/25/2022',
4)

INSERT INTO Plans(
	Title,
	Descripcion,
	IdPartido
)
VALUES
('Calle Fix',
'Mejorar los 20km de calle solicitados',
1),
('Mejorar Inversiones',
'Realizar upgrade de inversiones',
1),
('Reparar Dannos pasados',
'Hacer un arreglo a los dannos sucedidos en la presidencia pasada',
1),
('Calle Fix',
'Mejorar los 30km de calle solicitados',
2),
('Mejorar Inversiones',
'Realizar upgrade de inversiones',
2),
('Reparar Dannos pasados',
'Hacer un arreglo a los dannos sucedidos en la presidencia pasada',
2),
('Calle Fix',
'Mejorar los 15km de calle solicitados',
3),
('Mejorar Inversiones',
'Realizar upgrade de inversiones',
3),
('Reparar Dannos pasados',
'Hacer un arreglo a los dannos sucedidos en la presidencia pasada',
3),
('Calle Fix',
'Mejorar los 25km de calle solicitados',
4),
('Mejorar Inversiones',
'Realizar upgrade de inversiones',
4),
('Reparar Dannos pasados',
'Hacer un arreglo a los dannos sucedidos en la presidencia pasada',
4)

INSERT INTO Actions(
	IdPlan,
	Descripcion
)
VALUES
(1,
'Arreglar Carretera por solicitud de los habitantes del area'),
(2,
'Invertir en lo que el Pais necesita'),
(3,
'Iniciar con el arreglo por motivo de dannos ocasionados en el pais'),
(4,
'Arreglar Carretera por solicitud de los habitantes del area'),
(5,
'Invertir en lo que el Pais necesita'),
(6,
'Iniciar con el arreglo por motivo de dannos ocasionados en el pais'),
(7,
'Arreglar Carretera por solicitud de los habitantes del area'),
(8,
'Invertir en lo que el Pais necesita'),
(9,
'Iniciar con el arreglo por motivo de dannos ocasionados en el pais'),
(10,
'Arreglar Carretera por solicitud de los habitantes del area'),
(11,
'Invertir en lo que el Pais necesita'),
(12,
'Iniciar con el arreglo por motivo de dannos ocasionados en el pais')

INSERT INTO Cantones(
	Nombre,
	IdProvincia
)
VALUES
('Acosta',1),
('Alajuela',1),
('Curridabat',1),
('Escazu',1),
('Moravia',1),
('Naranjo',2),
('Orotina',2),
('Grecia',2),
('Guatuso',2),
('Alajuela',2),
('Cartago',3),
('Oreamuno',3),
('Paraiso',3),
('Turrialba',3),
('Jimenez',3),
('Abangares',4),
('Bagaces',4),
('Carrillo',4),
('Hojancha',4),
('La Cruz',4),
('Barva',5),
('Belen',5),
('Flores',5),
('Heredia',5),
('San Isidro',5),
('Guacimo',6),
('Limon',6),
('Matina',6),
('Pococi',6),
('Siquirres',6),
('Buenos Aires',7),
('Corredores',7),
('Coto Brus',7),
('Esparza',7),
('Golfito',7)

DECLARE @PartieID INT = 1
DECLARE @CantParties INT = 4
DECLARE @ActionID INT = 1
DECLARE @CantActions INT = 12
DECLARE @CantDeliveries INT
DECLARE @CantonID INT
DECLARE @ActualDeliver INT

WHILE @PartieID <= @CantParties
BEGIN
    ---- For each Action of that Politic party
    --WHILE @ActionID <= @CantActions
    --BEGIN
	    -- Random entre 3 y 10 
		SELECT @CantDeliveries = RAND()*(10-3)+3
		SELECT @ActualDeliver = 0
		WHILE @CantDeliveries >= @ActualDeliver
        BEGIN
			SELECT @CantonID = RAND()*(35-1)+1
			INSERT INTO Deliverables
			(
				IdAction,
				IdCanton,
				KpiValue,
				KpiType,
				Posttime,
				CheckSuma 
			)
			VALUES
			(
				RAND()*(3-1)+(3*(@PartieID-1))+1,
				@CantonID,
				RAND()*(1000-100)+100,
				RAND()*(1000-100)+100,
				DATEADD(dd, 700*RAND(), '03/07/2022'),
				RAND()*(1000-100)+100
			)

			SET @ActualDeliver = @ActualDeliver + 1
		END
	--END
	SET @PartieID = @PartieID + 1
END
