CREATE TABLE [Categories](
	[IdCategory] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL
) ON [PRIMARY]
GO

CREATE TABLE [Products](
	[IdProduct] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Prix] [money] NOT NULL,
	[IdCaterory] [int] FOREIGN KEY REFERENCES  Categories ([IdCategory])
) ON [PRIMARY]
GO


CREATE TABLE [Purchases](
	[IdPurchase] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[DatePurchase] [datetime] NOT NULL,
	[IdProduct] [int] FOREIGN KEY REFERENCES  [Products] ([IdProduct])
) ON [PRIMARY]
GO

INSERT INTO [Categories] ("Name") VALUES ('Food')
INSERT INTO [Categories] ("Name") VALUES ('Garden')
INSERT INTO [Categories] ("Name") VALUES ('Travel')
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Pain', 1.00, 1)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Café', 3.00, 1)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Beurre', 1.90, 1)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Sceau', 5.00, 2)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Pelle', 17.00, 2)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Rateau', 12.00, 2)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Sac de plage', 6.00, 1)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Serviette de plage', 20.00, 1)
INSERT INTO [Products] ([Name], [Prix], [IdCaterory]) VALUES ('Lunnette de soleil', 45.00, 1)

INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/02/2019', 1)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/03/2019', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/04/2019', 3)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/05/2019', 4)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/06/2019', 5)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/07/2019', 6)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/12/2019', 7)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/08/2019', 1)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/09/2019', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/10/2019', 3)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/11/2019', 4)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/12/2019', 5)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/01/2020', 6)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/02/2020', 7)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/03/2020', 1)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/04/2020', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/05/2020', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/06/2020', 3)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/07/2020', 4)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/08/2020', 5)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/02/2019', 1)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/03/2019', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/04/2019', 3)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/05/2019', 4)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/06/2019', 5)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/07/2019', 6)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/12/2019', 7)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/08/2019', 1)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/09/2019', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/10/2019', 3)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/11/2019', 1)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/12/2019', 5)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/01/2020', 6)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/02/2020', 7)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/03/2020', 1)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/04/2020', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/05/2020', 2)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/06/2020', 3)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/07/2020', 4)
INSERT INTO [Purchases]  ([DatePurchase],[IdProduct]) VALUES ('01/08/2020', 5)
GO


SELECT Categories.IdCategory, Categories.Name, count(*), SUM(Products.Prix) 
FROM [Purchases] INNER JOIN Products ON Products.IdProduct = Purchases.IdProduct
INNER Join Categories ON Categories.IdCategory = Products.IdCategory 
GROUP BY Categories.IdCategory, Categories.Name
