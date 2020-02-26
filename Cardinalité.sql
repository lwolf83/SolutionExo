USE [master]
GO
CREATE DATABASE [Shop20200225]
GO

CREATE TABLE [Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL
	)
GO
CREATE TABLE [Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[FK_CategoryId] [int] NULL
	)
GO

CREATE TABLE [Purchase](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[FK_ProductsID] [int] NULL,
	[date] [datetime] NOT NULL
	)
GO
CREATE TABLE [Stock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[FK_ProductID] [int] NULL,
	[Quantity] [int] NOT NULL
)
GO
ALTER TABLE [Products]  WITH CHECK ADD FOREIGN KEY([FK_CategoryId])
REFERENCES [Category] ([CategoryId])
GO
ALTER TABLE [Purchase]  WITH CHECK ADD FOREIGN KEY([FK_ProductsID])
REFERENCES [Products] ([ProductId])
GO
ALTER TABLE [Stock]  WITH CHECK ADD FOREIGN KEY([FK_ProductID])
REFERENCES [Products] ([ProductId])
GO


INSERT [Category] ([CategoryId], [Name]) VALUES (1, N'Aliments et boissons à base de végétaux')
INSERT [Category] ([CategoryId], [Name]) VALUES (2, N'Aliments dorigine végétale')
INSERT [Category] ([CategoryId], [Name]) VALUES (3, N'Plats préparés')
INSERT [Category] ([CategoryId], [Name]) VALUES (4, N'Viandes')
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (1, N'Products1', 10.0000, 1)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (2, N'Products2', 1.0000, 2)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (3, N'Products3', 2.0000, 3)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (4, N'Products4', 5.0000, 4)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (5, N'Products5', 4.0000, 1)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (6, N'Products6', 1.0000, 2)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (7, N'Products7', 12.0000, 3)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (8, N'Products8', 16.0000, 4)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (9, N'Products9', 11.0000, 1)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (10, N'Products10', 10.0000, 2)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (11, N'Products11', 7.0000, 3)
GO
INSERT [Products] ([ProductId], [Name], [Price], [FK_CategoryId]) VALUES (12, N'Products12', 4.0000, 4)
GO

INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (1, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (2, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (3, 3, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (4, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (5, 3, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (6, 4, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (7, 5, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (8, 6, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (9, 9, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (10, 10, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (11, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (12, 4, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (13, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (14, 4, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (15, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (16, 8, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (17, 9, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (18, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (19, 4, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (20, 3, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (21, 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (22, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (23, 11, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (24, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Purchase] ([PurchaseID], [FK_ProductsID], [date]) VALUES (25, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime))
GO
INSERT [Stock] ([StockId], [FK_ProductID], [Quantity]) VALUES (1, 1, 4)
GO
INSERT [Stock] ([StockId], [FK_ProductID], [Quantity]) VALUES (2, 2, 4)
GO
INSERT [Stock] ([StockId], [FK_ProductID], [Quantity]) VALUES (3, 3, 12)
GO
INSERT [Stock] ([StockId], [FK_ProductID], [Quantity]) VALUES (4, 4, 19)
GO
INSERT [Stock] ([StockId], [FK_ProductID], [Quantity]) VALUES (5, 7, 2)
GO
INSERT [Stock] ([StockId], [FK_ProductID], [Quantity]) VALUES (6, 9, 5)
GO

SELECT   Category.Name, SUM(Stock.Quantity)
FROM            Category INNER JOIN
                         Products ON Category.CategoryId = Products.FK_CategoryId INNER JOIN
                         Stock ON Products.ProductId = Stock.FK_ProductID
GROUP BY CategoryId, Category.Name
