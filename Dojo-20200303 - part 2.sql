DROP PROCEDURE IF EXISTS sp_hierarchy
GO

CREATE PROCEDURE sp_hierarchy
@idBoss int = 1,
@profondeur int = 1
as
BEGIN
declare 
	@Name VARCHAR(50),
	@id_Employee int,
	@counterEmployeeBoss int
declare @tiret varchar(50) = '---------------------------------------------------------------------------------'
select @counterEmployeeBoss = count(Employee.employee_id) from Employee where Employee.FK_superior_id = @idBoss


if @counterEmployeeBoss > 0
	begin

	DECLARE  Employee_Cursor  CURSOR LOCAL SCROLL FOR
		select Employee.[name], Employee.employee_id from Employee where Employee.FK_superior_id = @idBoss
	open Employee_Cursor
		FETCH FIRST FROM Employee_Cursor INTO @Name, @id_Employee
		
		WHILE (@@FETCH_STATUS = 0)
			BEGIN
			print left(@tiret, @profondeur) + @Name + ' - p = ' + Cast(@profondeur AS VARCHAR)
			Set @profondeur = @profondeur + 1
			if @id_Employee != 1
			begin
				execute sp_hierarchy @id_Employee,@profondeur
			end
			FETCH NEXT FROM Employee_Cursor INTO @Name, @id_Employee
			END

	CLOSE Employee_Cursor
	DEALLOCATE Employee_Cursor
	end
END
GO
