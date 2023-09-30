ALTER PROC DELETE_TURNO(
	@idturno int
)

AS 

SET NOCOUNT ON
IF EXISTS(
		SELECT * FROM CentroMedico.dbo.Turno WHERE idTurno = @idturno
	)


BEGIN
	DELETE FROM CentroMedico.dbo.TurnoPaciente WHERE idTurno = @idturno
	DELETE FROM CentroMedico.dbo.Turno WHERE idTurno = @idturno
END

ELSE
	SELECT 0 AS RESULTADO
