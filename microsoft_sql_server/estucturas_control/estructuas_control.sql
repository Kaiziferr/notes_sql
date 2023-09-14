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

