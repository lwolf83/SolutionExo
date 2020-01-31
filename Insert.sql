
CREATE DATABASE [GroceriesDB]
GO

USE [GroceriesDB]
CREATE TABLE [Product] (
	[idProduct] [int] NOT NULL IDENTITY,
	[products] [varchar](50) NOT NULL,
	[price] [Decimal](18,2) NOT NULL
)  ON [PRIMARY]
GO

CREATE TABLE [Grocery] (
	[idGrocery] [int] NOT NULL IDENTITY,
	[totalValue] [Decimal](18,2) NOT NULL,
	[date] [Datetime] NOT NULL
)  ON [PRIMARY]
GO

INSERT INTO [Product]	([products],[price]) VALUES ('Concombre',100.12)
INSERT INTO [Product]	([products],[price]) VALUES ('Poulet',10.12)
INSERT INTO [Product]	([products],[price]) VALUES ('Choux',7.12)

GO

INSERT INTO [Grocery]([totalValue],[date]) VALUES (120.23,GETDATE())
INSERT INTO [Grocery]([totalValue],[date]) VALUES (120.23,'20120618 10:34:09 AM')

GO
