DROP PROCEDURE IF EXISTS sp_GetAdherentsBySect;
GO

CREATE PROCEDURE sp_GetAdherentsBySect
   AS
   BEGIN
		SELECT Sect.name, count(Adherent.adherent_id)
		FROM            Adherent INNER JOIN
								 SectAdherent ON Adherent.adherent_id = SectAdherent.FK_adherent_id INNER JOIN
								 Sect ON SectAdherent.FK_sect_id = Sect.sect_id
		GROUP BY Sect.name
   END
GO

DROP PROCEDURE IF EXISTS sp_SetSectAdherent;
GO

CREATE PROCEDURE sp_SetSectAdherent
   AS
   BEGIN

		DECLARE Adh_Cursor CURSOR SCROLL FOR
		   SELECT adherent_id FROM Adherent
		DECLARE Sect_Cursor CURSOR SCROLL FOR
		   SELECT sect_id FROM Sect

		DECLARE @SectId Int
		DECLARE @AdhId Int

		OPEN Sect_Cursor
		FETCH FIRST FROM Sect_Cursor INTO @SectId
			  WHILE @@FETCH_STATUS = 0
				 BEGIN
					OPEN Adh_Cursor
					FETCH FIRST FROM Adh_Cursor INTO @AdhId
						  WHILE @@FETCH_STATUS = 0
							 BEGIN
							  IF((SELECT count(*) FROM SectAdherent WHERE FK_adherent_id = @AdhId AND FK_sect_id = @SectId) = 0)
								BEGIN
									INSERT INTO SectAdherent (FK_adherent_id, FK_sect_id) VALUES (@AdhId, @SectId)
							
								END
								FETCH NEXT FROM Adh_Cursor INTO @AdhId
							 END
					CLOSE Adh_Cursor
					FETCH NEXT FROM Sect_Cursor INTO @SectId
				 END
				 CLOSE Sect_Cursor
		DEALLOCATE Sect_Cursor
		DEALLOCATE Adh_Cursor
	END
GO

DROP PROCEDURE IF EXISTS sp_GetSectCount;
GO

CREATE PROCEDURE sp_GetSectCount
   AS
	BEGIN
		RETURN (SELECT  count( [sect_id])
				FROM [Sect])
	END
GO

DECLARE @SectCount INT
EXECUTE @SectCount = sp_GetSectCount
PRINT @SectCount
GO
