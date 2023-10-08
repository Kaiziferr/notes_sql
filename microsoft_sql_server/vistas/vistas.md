CREATE VIEW PacientesTurnos AS


SELECT 
	P.idPaciente,
	P.nombre,
	P.apellido,
	T.idTurno,
	T.estado
FROM Paciente p
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno



SELECT * FROM PacientesTurnos
