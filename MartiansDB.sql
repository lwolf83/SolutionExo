IF(db_id(N'Martian') IS NULL)
	BEGIN
		CREATE DATABASE [Martian]
	END
GO

USE [Martian]
GO

IF(EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Martians'))
BEGIN
	DROP TABLE [Martians]
END

IF(EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Terran'))
BEGIN
	DROP TABLE [Terran]
END

CREATE TABLE [Continent] (
	[idContinent] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[name] [VARCHAR](50) not null
  )
GO

CREATE TABLE [MartiansBases] (
	[idMartiansBase] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[name] [VARCHAR](50) not null
  )
GO

CREATE TABLE [Terran](
	[idTerran] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[name] [VARCHAR](50) not null,
	[idContinent] [int]  FOREIGN KEY REFERENCES  [Continent]([idContinent])
  )
GO

CREATE TABLE [Martians](
	[idMartians] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[name] [VARCHAR](50) not null,
	[idTerran] [int] FOREIGN KEY REFERENCES  Terran(idTerran),
	[idMartiansOfficer] [int] FOREIGN KEY REFERENCES  [Martians] (idMartians),
	[idMartiansBase] [int] FOREIGN KEY REFERENCES  [MartiansBases] (idMartiansBase)
  )
GO

INSERT INTO Continent ("name") VALUES ('Atlantide')
INSERT INTO Continent ("name") VALUES ('Europe')
INSERT INTO Continent ("name") VALUES ('Asie')
INSERT INTO Continent ("name") VALUES ('Lune')

INSERT INTO [MartiansBases] ("name") VALUES ('Base1')
INSERT INTO [MartiansBases] ("name") VALUES ('Base2')
INSERT INTO [MartiansBases] ("name") VALUES ('Base3')
INSERT INTO [MartiansBases] ("name") VALUES ('Base4')

INSERT INTO Terran ("idContinent", "name") VALUES (1, 'John')
INSERT INTO Terran ("idContinent", "name") VALUES (1, 'John2')
INSERT INTO Terran ("idContinent", "name") VALUES (1, 'John3')
INSERT INTO Terran ("idContinent", "name") VALUES (1, 'John4')
INSERT INTO Terran ("idContinent", "name") VALUES (1, 'John5')
INSERT INTO Terran ("idContinent", "name") VALUES (1, 'John6')

INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Emperor',1, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('ET',2, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Alien',3, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Thor',4, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Alf',4, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Prédator',4, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Superman',2, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Yoda',5, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Le docteur',1, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Yondu',2, 1, 1)
INSERT INTO Martians ([name],[idTerran],[idMartiansOfficer], [idMartiansBase]) VALUES  ('Spock',1, 1, 1)

SELECT Martians.name As MartianName, Terran.name As TerranName, Continent.name AS TerranContient, MartiansBases.Name As MartianName  
FROM Martians INNER JOIN Terran ON Martians.idTerran = Terran.idTerran 
INNER JOIN Continent ON Terran.idContinent = Continent.idContinent
INNER JOIN MartiansBases ON MartiansBases.idMartiansBase = Martians.idMartiansBase

