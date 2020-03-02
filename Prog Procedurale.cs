DECLARE @maxPersonByCity INT = 100

DECLARE @cityId AS INT
DECLARE @infected BIT = 0
DECLARE @cpt INT = 0
DECLARE @nbResultLinge INT = 1


SELECT @cityId = city_id FROM city ORDER BY NEWID() 

WHILE @nbResultLinge > 0
BEGIN
	SELECT @cityId = city_id FROM city ORDER BY NEWID() 
	INSERT INTO Person (name, is_infected, FK_city_id) VALUES (CONCAT('Bob', @cpt), @infected, @cityId)
	SET @cpt = @cpt + 1
	IF(@infected = 1)
		BEGIN
			SET @infected = 0
		END
	ELSE
		BEGIN
			SET @infected = 1
		END

	-- je regarde combien de ville n'ont pas encore 10 personnes dedans
	SELECT @cityId =  city_id FROM City WHERE city_id IN (
	SELECT city_id
	FROM            City
	left outer join Person on City.city_id = Person.FK_city_id
	GROUP BY city_id, City.name
	HAVING count(person.person_id) < @maxPersonByCity
	)
	-- je compte le nombre de ligne résultat. Si égal à 0, l'insertion s'arrête
	SELECT @nbResultLinge = @@ROWCOUNT -- 
	
END 

DECLARE @worldMean AS FLOAT

SELECT @worldMean = CAST(Sum(CASE WHEN is_infected = 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(person.person_id)
FROM            Person INNER JOIN
                         City ON Person.FK_city_id = City.city_id INNER JOIN
                         Country ON City.FK_country_id = Country.country_id

SELECT    Country.name,    City.name, Sum(CASE WHEN is_infected = 1 THEN 1 ELSE 0 END) AS NbInfected , COUNT(Person.person_id) AS nbInhabitant
FROM            City INNER JOIN
                         Country ON City.FK_country_id = Country.country_id INNER JOIN
                         Person ON City.city_id = Person.FK_city_id
WHERE Country.country_id IN (
   SELECT Country.country_id
		FROM            Person INNER JOIN
								 City ON Person.FK_city_id = City.city_id INNER JOIN
								 Country ON City.FK_country_id = Country.country_id
		GROUP BY Country.country_id, Country.name
		HAVING CAST(Sum(CASE WHEN is_infected = 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(person.person_id)  > @worldMean
		)
GROUP BY Country.country_id, Country.name, City.city_id, City.name
ORDER BY Country.name,    City.name
