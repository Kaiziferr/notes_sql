BEGIN TRANSACTION 
	-- UPDATE CentroMedico.dbo.Paciente SET telefono = 444 WHERE idPaciente = 15;
	UPDATE CentroMedico.dbo.Paciente SET telefono = 444;
	IF @@ROWCOUNT = 1 -- INDICA CUANTOS REGISTROS FUERON ACTUALIZADOS CON LA SENTENCIA ANTERIOR
		COMMIT TRANSACTION -- CONFIRMA LA TRANSACCION
	ELSE
		ROLLBACK TRANSACTION -- CANCELA LA TRANSACCION
