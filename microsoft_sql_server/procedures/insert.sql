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
