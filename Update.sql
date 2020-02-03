DROP DATABASE [GroceriesDB]
GO

CREATE DATABASE [GroceriesDB]
GO

USE [GroceriesDB]
CREATE TABLE [Customer] (
	[idProduct] [int] NOT NULL IDENTITY,
	[name] [varchar](50) NOT NULL,
)  ON [PRIMARY]
GO

INSERT INTO [Customer] ([NAME]) VALUES ('fsfdsz')
INSERT INTO [Customer] ([NAME]) VALUES ('ericz')
INSERT INTO [Customer] ([NAME]) VALUES ('bobz')
INSERT INTO [Customer] ([NAME]) VALUES ('samz')

GO

UPDATE [Customer] SET [NAME] = SUBSTRING([NAME], 0, LEN([NAME]))  WHERE name like '%z'
GO
