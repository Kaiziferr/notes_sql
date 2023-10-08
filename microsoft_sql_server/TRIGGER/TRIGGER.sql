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
