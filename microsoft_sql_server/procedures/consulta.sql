-- SIMPLE CREATE
--______________________________________________________


-- is usethe word PROCEDURE too 
CREATE PROC SP_paciente ( --S: select P: procedure
	@idPaciente int -- declarate the atribute
	
)
AS 

SELECT * FROM Paciente WHERE idPaciente = @idPaciente;
