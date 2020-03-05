
CREATE PROCEDURE sp_create_data_set
	@minUser INT = 10000
AS
BEGIN
	DECLARE @minUserByCountries INT

	SET NOCOUNT ON

	PRINT('CREATION DES CONTINENT START')
	INSERT INTO [Continent] ([name]) VALUES ('Europe'), ('Asie'), ('Amérique')
	PRINT('CREATION DES CONTINENT END')

	PRINT('CREATION DES PAYS START')
	INSERT INTO [Country] ([name], [FK_continent_id]) VALUES ('France', 1), ('Allemagne', 1), ('Italie', 1),
																	 ('Chine', 2), ('Japon', 2), ('Inde', 2),
																	 ('Etats-Unis', 3), ('Brésil', 3), ('Colombie', 3)
	PRINT('CREATION DES PAYS START')

	PRINT('CREATION DES UTILISATEURS START')
	BEGIN
	with randowvalues
		as(
		   select 1 id, CAST(RAND(CHECKSUM(NEWID()))*100 as int) randomnumber
			union  all
			select id + 1, CAST(RAND(CHECKSUM(NEWID()))*100 as int)  randomnumber
			from randowvalues
			where 
			  id < @minUser
		  )

		INSERT INTO [User] (full_name, email, is_male, birthdate, FK_country_id, created_at) 
		select 'Name' + CAST(id AS VARCHAR),  'Name' + CAST(id  AS VARCHAR)  + '@email.fr', ABS(CHECKSUM(NewId())) % 2, DATEADD(day, - ABS(CHECKSUM(NewId())) % 25000 - 6570, GETDATE()), FLOOR(RAND(CHECKSUM(NEWID()))*(6-1+1)) + 1, getdate()
		from randowvalues 
		OPTION(MAXRECURSION 0)
	END	
	PRINT('CREATION DES UTILISATEURS END')

	PRINT('AJOUT DES MERCHANTS STARD')
	INSERT INTO Merchant (name, FK_user_id, FK_country_id, created_at)
	SELECT TOP(@minUser/10) CONCAT('Boutique de ', full_name), user_id, FLOOR(RAND(CHECKSUM(NEWID()))*(6-1+1)) + 1, GETDATE()  FROM [User] ORDER BY NEWID()
	PRINT('AJOUT DES MERCHANTS END')

	PRINT('AJOUT DES PRODUCTS START')
	DECLARE @ProductCount INT = 0
	WHILE @ProductCount < 270
		BEGIN
			INSERT INTO Product ([created_at], [name], [price])
			VALUES (GETDATE(), CONCAT('product', @ProductCount), FLOOR(RAND()*(20-10+1))+10)
			SET @ProductCount = @ProductCount + 1
		END
	PRINT('AJOUT DES PRODUCTS END')


	PRINT('AJOUT DES ProductStock START')
		INSERT INTO ProductStock ([quantity], [FK_product_id], [FK_merchant_id])
		SELECT   ABS(CHECKSUM(NewId())) % 100,    Product.product_id, Merchant.merchant_id
		FROM  Product CROSS JOIN Merchant
	PRINT('AJOUT DES ProductStock END')

	PRINT('AJOUT DES Order START')
	DECLARE @numberOfOrder INT
	set @numberOfOrder = @minUser/6
	INSERT INTO [Order] ([created_at], [is_completed], [FK_user_id])
	SELECT TOP(@numberOfOrder)  GETDATE(), 1,  [User].user_id
	FROM            [User] LEFT OUTER JOIN Merchant ON [User].user_id = Merchant.FK_user_id
	WHERE (Merchant.merchant_id IS NULL) ORDER BY NEWID()
	PRINT('AJOUT DES Order END')

	PRINT('AJOUT DES OrderProduct START')
	DECLARE @nbOrderWithoutOrderProduct INT = 1
	DECLARE @cpt INT = 1
	WHILE  @cpt < 4
	BEGIN
		DECLARE @OrderTable TABLE ( order_id INT );
		DECLARE @ProductTable TABLE ( product_id INT );

		INSERT  INTO @OrderTable
		SELECT TOP(500) order_id FROM [Order] ORDER BY NEWID()

		INSERT INTO @ProductTable 
		SELECT TOP(500) product_id FROM [Product] ORDER BY NEWID()

		INSERT INTO OrderProduct ([quantity], [FK_order_id], [FK_product_id]) 
		SELECT ABS(CHECKSUM(NewId())) % 100, order_id, product_id FROM @OrderTable CROSS JOIN @ProductTable

		SET @cpt = @cpt + 1
	END
	PRINT('AJOUT DES OrderProduct END')
END

--EXEC sp_create_data_set 1000000
