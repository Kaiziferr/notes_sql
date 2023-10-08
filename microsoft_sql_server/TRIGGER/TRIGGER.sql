CREATE TRIGGER PacientesCreados ON Paciente
AFTER INSERT
AS

-- inserted hace referencia sobre lo ultimo que se inserto
IF (SELECT idPais FROM inserted) = 'COL'
	INSERT INTO PacienteLog (idPaciente, idPais, fechaAlta)
		SELECT i.idPaciente, idPais, GETDATE() FROM inserted i


SELECT * FROM Paciente;

INSERT INTO Paciente VALUES(123456789, 'Monfy', 'Bernal', '20150505', 'cra','COL','' ,'', 'neL')

SELECT * FROM PacienteLog;




CREATE TRIGGER PacientesModificados ON Paciente
AFTER UPDATE
AS

IF EXISTS(SELECT idPaciente FROM PacienteLog
			WHERE idPaciente = (SELECT idPaciente FROM INSERTED))


	UPDATE PacienteLog SET fechaModificacion = GETDATE()
	WHERE idPaciente = (SELECT idPaciente FROM INSERTED)

ELSE 
	INSERT INTO PacienteLog (idPaciente, idPais, fechaModificacion)
	SELECT idPaciente, idPais, GETDATE() FROM INSERTED


select * from Paciente

select * from PacienteLog

UPDATE Paciente SET dni = 147852369 where idPaciente = 7; 



CREATE TRIGGER PacienteBaja ON Paciente
FOR DELETE
AS
-- AFTER DELETE -- ELIMINA EN LA TABLA QUE ALMACENA O HACE CAMBIOS

IF EXISTS(SELECT idPaciente FROM PacienteLog
			WHERE idPaciente = (SELECT idPaciente FROM deleted))

	UPDATE PacienteLog SET fechaBaja = GETDATE()
	WHERE idPaciente = (SELECT idPaciente FROM deleted)

ELSE 
	INSERT INTO PacienteLog (idPaciente, idPais, fechaBaja)
	SELECT idPaciente, idPais, GETDATE() FROM deleted

DELETE FROM Paciente where idPaciente = 22; 
