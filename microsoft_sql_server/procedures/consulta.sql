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

---------------------------------------------------------------------------------------
ALTER PROC SEL_HistoriaPaciente(
	@idpaciente INT
)

AS 

SET NOCOUNT ON

IF EXISTS(
	SELECT * FROM CentroMedico.dbo.Paciente P
	INNER JOIN CentroMedico.dbo.HistoriaPaciente HP
	ON P.idPaciente = HP.idPaciente
	INNER JOIN CentroMedico.dbo.Historia H
	ON H.idHistoria = HP.idHistoria
	INNER JOIN CentroMedico.dbo.MedicoEspecialidad ME
	ON HP.idMedico = ME.idMedico
	INNER JOIN CentroMedico.dbo.Medico M
	ON ME.idMedico = M.idMedico
	WHERE P.idPaciente = @idpaciente)

	SELECT * FROM CentroMedico.dbo.Paciente P
	INNER JOIN CentroMedico.dbo.HistoriaPaciente HP
	ON P.idPaciente = HP.idPaciente
	INNER JOIN CentroMedico.dbo.Historia H
	ON H.idHistoria = HP.idHistoria
	INNER JOIN CentroMedico.dbo.MedicoEspecialidad ME
	ON HP.idMedico = ME.idMedico
	INNER JOIN CentroMedico.dbo.Medico M
	ON ME.idMedico = M.idMedico
	WHERE P.idPaciente = @idpaciente;
ELSE
	PRINT 'NO EXISTE HISTORIA MEDICA PARA EL PACIENTE'


EXEC SEL_HistoriaPaciente 12


---------------------------------------------------------------------------

ALTER PROC SELECT_ESPECIALIDADESMEDICAS

AS

SET NOCOUNT ON

IF EXISTS(SELECT * FROM CentroMedico.dbo.Especialidad)
	SELECT * FROM CentroMedico.dbo.Especialidad
ELSE
	SELECT 0 AS RESULTADO


EXEC SELECT_ESPECIALIDADESMEDICAS
