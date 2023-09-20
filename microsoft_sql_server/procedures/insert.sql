EXEC IP_PACIENTE '987654321', 'VIOLETA', 'Bernal', '20151105', 'CR 5 NORTE', 'COL', '', 'vbernal@gmail.com', ''

ALTER PROC IP_PACIENTE(
	@dni VARCHAR(20),
	@nombre VARCHAR(50),
	@apellido VARCHAR(50),
	@fnacimiento VARCHAR(8),
	@domicilio VARCHAR(50),
	@idpais CHAR(3),
	@telefono VARCHAR(20),
	@email VARCHAR(30),
	@observacion VARCHAR(1000)=''
)

AS 

IF NOT EXISTS(SELECT * FROM CentroMedico.dbo.Paciente WHERE dni = @dni)
	BEGIN
		INSERT INTO CentroMedico.dbo.Paciente (dni, nombre, apellido, fnacimiento, domicilio, idpais, telefono, email, observacion)
		VALUES (@dni, @nombre, @apellido, @fnacimiento, @domicilio, @idpais, @telefono, @email, @observacion)
		PRINT 'PACIENTE INGRESADO SATISFACTORIAMENTE'
		RETURN
	END
ELSE
	BEGIN
		PRINT 'PACIENTE NO INGRESADO POR QUE YA EXISTE'
	END



/*SELECT * FROM CentroMedico.dbo.Turno;
SELECT * FROM CentroMedico.dbo.TurnoEstado;
SELECT * FROM CentroMedico.dbo.TurnoPaciente;
SELECT * FROM CentroMedico.dbo.Medico;
*/

EXEC IT_TurnoEstado '20200505 13:00',7,2,'Paciente en ayunas'

ALTER PROC IT_TurnoEstado(
	@fehaTurno CHAR(14), --20230505 12:00
	@idPaciente  INT,
	@idmedico INT,
	@observacion VARCHAR(100) = ''
)

AS

/*
ESTADO = 0 (pendiente)
ESTADO = 1 (realizado)
ESTADO = 2 (cancelado)
*/

IF NOT EXISTS(SELECT TOP 1 idTurno FROM CentroMedico.dbo.TURNO 
	WHERE fechaTurno = @fehaTurno AND estado NOT IN (1, 2))
	BEGIN
		INSERT INTO CentroMedico.dbo.TURNO(fechaTurno, estado, observacion) VALUES (
			@fehaTurno, 0, @observacion
		)
		DECLARE @auxIdTurno INT;
		SET @auxIdTurno = @@IDENTITY

		INSERT INTO CentroMedico.dbo.TurnoPaciente(idTurno, idPaciente, idMedico)
		VALUES (@auxIdTurno, @idPaciente, @idmedico)

		PRINT 'EL turno se agrego correctamente'
		RETURN
	END
ELSE
	BEGIN
		PRINT 'El turno no existe'
	END


/*
SELECT * FROM CentroMedico.dbo.Medico;
SELECT * FROM CentroMedico.dbo.MedicoEspecialidad;
SELECT * FROM CentroMedico.dbo.Especialidad;
*/

EXEC IM_MEDICO 'Camilo', 'Otawa', 1, 'Disponible de 6 en adelante'

ALTER PROC IM_MEDICO (
	@nombre varchar(50),
	@apellido varchar(20),
	@idespecialidad int,
	@descripcion varchar(50)
)

AS

IF  EXISTS(SELECT * FROM CentroMedico.dbo.Especialidad WHERE idEspecialidad = @idespecialidad)
	BEGIN
		INSERT INTO CentroMedico.dbo.Medico(Nombre, Apellido) VALUES (@nombre, @apellido)

		DECLARE @idAuxMedico INT;
		SET @idAuxMedico = @@IDENTITY

		INSERT INTO CentroMedico.dbo.MedicoEspecialidad (idMedico, idEspecialidad, Descripcion) 
		VALUES (@idAuxMedico, @idespecialidad, @descripcion)
	END
ELSE
	BEGIN
		PRINT 'ERROR'
	END


