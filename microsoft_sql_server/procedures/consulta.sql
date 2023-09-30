-- SIMPLE CREATE
--______________________________________________________


-- is usethe word PROCEDURE too 
CREATE PROC SP_paciente ( --S: select P: procedure
	@idPaciente int -- declarate the atribute
	
)
AS 

SELECT * FROM Paciente WHERE idPaciente = @idPaciente;

---------------------------------------------------------------------------------------
ALTER PROC SELECT_TurnoPaciente(
	@idpaciente INT
)

AS

SET NOCOUNT ON

/*
SELECT * FROM CentroMedico.dbo.Especialidad;

SELECT * FROM CentroMedico.dbo.MedicoEspecialidad;
INSERT INTO CentroMedico.dbo.MedicoEspecialidad VALUES (2, 2, '')
*/

SELECT * FROM CentroMedico.dbo.Paciente P
INNER JOIN CentroMedico.dbo.TurnoPaciente TP
ON P.idPaciente = TP.idPaciente 
INNER JOIN CentroMedico.dbo.Turno T
ON T.idTurno = TP.idTurno
INNER JOIN CentroMedico.dbo.MedicoEspecialidad M
ON M.idMedico = TP.idMedico
WHERE P.idPaciente = @idpaciente;



EXEC SELECT_TurnoPaciente 7;
