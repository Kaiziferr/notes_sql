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

--CASE
DECLARE @valor int = 15;

DECLARE @semaforo VARCHAR(10);

SET @semaforo = (
	CASE 
		WHEN @valor <= 10 THEN 'RED'
		WHEN @valor > 10 AND @valor <= 20 THEN 'YELLOW'
		WHEN @valor > 20 THEN 'GREEN'
	END
)

PRINT @semaforo;


SELECT *, (CASE
				WHEN idTurno = 1 THEN 'RED'
				WHEN idTurno = 3 THEN 'YELLOW'
				WHEN idTurno = 5 THEN 'GREEN'
			END) AS 'SEMAFOROP' FROM TURNO;
