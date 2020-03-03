
DROP PROCEDURE IF EXISTS sp_salary_increment
GO
CREATE PROCEDURE sp_salary_increment
		 @Increment FLOAT = 1.1,
		 @TEST varchar(10)
		 AS 
BEGIN
				 DECLARE @Name VARCHAR(50),
						 @WorkedYears INT,
						 @BaseSalary INT

		DECLARE id_Employee_Cursor CURSOR SCROLL FOR
				SELECT Employee.name, Employee.years_worked, [Function].base_salary FROM Employee
				INNER JOIN "Function" ON Employee.FK_function_id = "Function".function_id

		OPEN id_Employee_Cursor
		FETCH FIRST FROM id_Employee_Cursor INTO @Name, @WorkedYears, @BaseSalary

		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			DECLARE @CurrentSalary FLOAT
			SET @CurrentSalary = @BaseSalary *POWER( @Increment, @WorkedYears /3)
			PRINT CONCAT (@TEST, ' ', @Name, ' ', @CurrentSalary, ' ', @BaseSalary, ' ',@WorkedYears)
			FETCH NEXT FROM id_Employee_Cursor INTO @Name, @WorkedYears, @BaseSalary
		END
		CLOSE id_Employee_Cursor
		DEALLOCATE id_Employee_Cursor
END
GO



