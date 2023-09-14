-- SIMPLE CREATE
--______________________________________________________


-- is usethe word PROCEDURE too 
CREATE PROC SP_paciente ( --S: select P: procedure
	@idPaciente int -- declarate the atribute
	
)
AS 

SELECT * FROM Paciente WHERE idPaciente = @idPaciente;


-- DECLARE VARIABLES
--______________________________________________________

DECLARE @variableA CHAR(1) = 'a'; -- DECLATE AN VARIABLE
PRINT @variableA;
SET @variableA = 'A'; -- UPDATE THE VARIABLE
PRINT @variableA; -- PRINT to CMD


DECLARE @variableB CHAR(1);
DECLARE @variableC CHAR(2);
SET @variableB = ISNULL(@variableC, 'N'); -- IF IS NULL THEN SET OTHER VALUE

PRINT @variableB;

-- DECLARE @variableB CHAR(1)

-- Example for declare var

DECLARE @entero INT

SET @entero = NULL

SELECT ISNULL(@entero, 0) AS Valor

PRINT @entero;


DECLARE @decimal DECIMAL(10,2)

SET @decimal = NULL

SELECT ISNULL(@decimal, 0.00) AS Valor



DECLARE @cadena VARCHAR(50)

SET @cadena = NULL

SELECT ISNULL(@cadena, 'Texto predeterminado') AS Valor



DECLARE @fecha DATETIME

SET @fecha = NULL

SELECT ISNULL(@fecha, GETDATE()) AS Valor



DECLARE @booleano BIT

SET @booleano = NULL

SELECT ISNULL(@booleano, 0) AS Valor



DECLARE @moneda MONEY

SET @moneda = NULL

SELECT ISNULL(@moneda, 0.00) AS Valor

