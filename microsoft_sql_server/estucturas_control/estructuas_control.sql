DECLARE @idpaciente int;
DECLARE @idturno int

SET @idpaciente = 7;

IF @idpaciente = 7
	BEGIN
		SET @idturno = 5;
		SELECT * FROM Paciente WHERE idPaciente = @idpaciente;
		PRINT @idturno

		IF EXISTS(SELECT * FROM Turno WHERE idTurno = @idturno)
			BEGIN
				PRINT 'Exste turno'
			END
	END
ELSE
	BEGIN
		PRINT 'No se cumplio la condicion'
	END



--WHILE
DECLARE @contador INT = 0;
WHILE @contador <= 10
	BEGIN
		PRINT @contador
		SET @contador = @contador + 1
	END

DECLARE @contador int = 0;

WHILE @contador < 10
	BEGIN
		PRINT @contador
		SET @contador = @contador + 1
		IF @contador = 3
			BREAK
	END

PRINT @contador
PRINT 'SALE POR QUE NO CUMPLIO LA CONDICION'

--CASE
DECLARE @valor INT;
DECLARE @semaforo VARCHAR(10);

SET @valor = 50;

SET @semaforo = (
	CASE WHEN @valor <= 10 THEN 'RED'
		 WHEN @valor > 10 AND @valor <=20 THEN 'YELLOW'
		 WHEN @valor > 20 AND @valor <= 30 THEN 'GREEN'
		 ELSE 'BURNED'
	END
)

PRINT @semaforo


SELECT *, (CASE
				WHEN idTurno = 1 THEN 'RED'
				WHEN idTurno = 3 THEN 'YELLOW'
				WHEN idTurno = 5 THEN 'GREEN'
			END) AS 'SEMAFOROP' FROM TURNO;


-- Recorre una tabla
DECLARE @i INT, @total INT;
SET @i = 1;
SET @total = (SELECT COUNT(*) FROM CentroMedico.dbo.Paciente);
PRINT @total; 

WHILE @i <= 20
BEGIN
	DECLARE @name VARCHAR(50);
	SET @name = (SELECT nombre FROM CentroMedico.dbo.Paciente where idPaciente = @i);
	PRINT @name 
	SET @i = @i + 1
END
