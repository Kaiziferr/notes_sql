DECLARE @fecha CHAR(12)
DECLARE @path VARCHAR(100)
DECLARE @name VARCHAR(20)

-- PRINT CONVERT(CHAR(8), GETDATE(), 112)

SET @fecha = CONCAT(CONVERT(CHAR(8), GETDATE(), 112), REPLACE(CONVERT(CHAR(5), GETDATE(), 108), ':', ''))
SET @path = CONCAT('D:\sql\Temporal\CentroMedico_', @fecha , '.bak')
SET @name  = 'CentromMedico35'

-- Guardar un directorio base de datos
BACKUP DATABASE CentroMedico1
TO DISK =  @path
WITH NO_COMPRESSION, NAME=@name 
