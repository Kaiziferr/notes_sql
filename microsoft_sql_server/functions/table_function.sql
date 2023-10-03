
ALTER FUNCTION listaPaises()
RETURNS @paises TABLE(idpais CHAR(3), pais VARCHAR(50))
AS
BEGIN
	INSERT INTO @paises VALUES('ESP', 'España')
	INSERT INTO @paises VALUES('MEX', 'MEXICO')
	INSERT INTO @paises VALUES('CHI', 'CHILE')
	INSERT INTO @paises VALUES('PER', 'Perú')
	INSERT INTO @paises VALUES('ARG', 'Argentina')
	RETURN
END

SELECT * FROM dbo.listaPaises()
