CREATE PROC UPD_TURNO(
	@idturno int,
	@estado tinyint,
	@observacion VARCHAR(30)
)

AS 

IF EXISTS(
		SELECT * FROM CentroMedico.dbo.Turno WHERE idTurno = @idturno
	)
	BEGIN
		UPDATE CentroMedico.dbo.Turno 
		SET 
		estado = @estado,
		observacion = @observacion
		WHERE idTurno = @idturno
	END
ELSE
	SELECT 0 AS RESULTADO
