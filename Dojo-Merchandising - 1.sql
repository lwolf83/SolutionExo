CREATE PROCEDURE sp_createDataStructure
AS
BEGIN

DROP TABLE IF EXISTS [OrderProduct]
DROP TABLE IF EXISTS [Order]
DROP TABLE IF EXISTS [ProductStock]
DROP TABLE IF EXISTS [Product]
DROP TABLE IF EXISTS [Merchant]
DROP TABLE IF EXISTS [User]
DROP TABLE IF EXISTS [Country]
DROP TABLE IF EXISTS [Continent]

PRINT('Creation table continent Start')
CREATE TABLE [Continent] ([continent_id] INT PRIMARY KEY IDENTITY(1,1),
					      [name] VARCHAR(50)) 
PRINT('Creation table continent End')

PRINT('Creation table Country Start')
CREATE TABLE [Country] ([country_id] INT PRIMARY KEY IDENTITY(1,1),
					    [name] VARCHAR(150),
					    [FK_continent_id] INT NOT NULL,
					    FOREIGN KEY ([FK_continent_id]) REFERENCES Continent([continent_id]))
PRINT('Creation table Country End')

PRINT('Creation table User Start')
CREATE TABLE [User] ([user_id] INT PRIMARY KEY IDENTITY(1,1),
					 [full_name] VARCHAR(120),
					 [email] VARCHAR(150),
					 [is_male] BIT,
					 [birthdate] DATE,
					 [created_at] DATETIME NOT NULL,
					 [FK_country_id] INT NOT NULL,
					 FOREIGN KEY ([FK_country_id]) REFERENCES [Country]([country_id]))
PRINT('Creation table User End')

PRINT('Creation table Merchant Start')
CREATE TABLE [Merchant] ([merchant_id] INT PRIMARY KEY IDENTITY(1,1),
						 [name] VARCHAR(150),
						 [created_at] DATETIME NOT NULL,
						 [FK_country_id] INT NOT NULL,
						 FOREIGN KEY ([FK_country_id]) REFERENCES [Country]([country_id]),
						 [FK_user_id] INT NOT NULL,
						 FOREIGN KEY ([FK_user_id]) REFERENCES [User]([user_id]))
PRINT('Creation table Merchant End')

PRINT('Creation table Product Start')
CREATE TABLE [Product] ([product_id] INT PRIMARY KEY IDENTITY(1,1),
						[name] VARCHAR(255) NOT NULL,
						[price] DECIMAL NOT NULL,
						[created_at] DATETIME NOT NULL)
PRINT('Creation table Product End')

PRINT('Creation table ProductStock Start')
CREATE TABLE [ProductStock] ([product_stock_id] INT PRIMARY KEY IDENTITY(1,1),
							 [quantity] INT NOT NULL,
							 [FK_product_id] INT NOT NULL,
							 FOREIGN KEY ([FK_product_id]) REFERENCES [Product]([product_id]),
							 [FK_merchant_id] INT NOT NULL,
							 FOREIGN KEY ([FK_merchant_id]) REFERENCES [Merchant]([merchant_id]))
PRINT('Creation table ProductStock End')

PRINT('Creation table Order Start')
CREATE TABLE [Order] ([order_id] INT PRIMARY KEY IDENTITY(1,1),
					  [is_completed] BIT NOT NULL,
					  [created_at] DATETIME,
					  [FK_user_id] INT NOT NULL,
					  FOREIGN KEY ([FK_user_id]) REFERENCES [User]([user_id]))
PRINT('Creation table Order End')

PRINT('Creation table OrderProduct Start')
CREATE TABLE [OrderProduct] ([order_product_id] INT PRIMARY KEY IDENTITY(1,1),
					         [quantity] INT NOT NULL,
							 [FK_product_id] INT NOT NULL,
							 FOREIGN KEY ([FK_product_id]) REFERENCES [Product]([product_id]),
							 [FK_order_id] INT NOT NULL,
							 FOREIGN KEY ([FK_order_id]) REFERENCES [Order]([order_id]))
PRINT('Creation table OrderProduct End')
END
