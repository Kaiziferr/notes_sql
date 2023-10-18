ALTER FUNCTION SUMAR(@X INT, @Y INT)
RETURNS INT
AS
BEGIN
	DECLARE @RES INT;
	SET @RES = @X + @Y
	RETURN @RES
END

SELECT dbo.SUMAR(2,5)


CREATE FUNCTION CONCATENATE(@name VARCHAR(10), @lastname VARCHAR(10))
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @res VARCHAR(100);
	SET @res = CONCAT(@name, @lastname);
	RETURN @res;
END

SELECT dbo.CONCATENATE('Steven', 'Bang')


-- IMPRIMIR LA FECHA EN LENGUAJE NATURAL

print dbo.FCN_FechaTexto('20230505')


ALTER FUNCTION FCN_FechaTexto(@fecha datetime)
RETURNS VARCHAR(60)
AS
BEGIN
	DECLARE @dia VARCHAR(20)
	DECLARE @mes VARCHAR(20)
	DECLARE @fechaTexto VARCHAR(60)

	SET @dia = (
		CASE WHEN DATEPART(dw, @fecha) = 1 THEN 'Domingo '+ CONVERT(CHAR(2), DATEPART(dd, @fecha))
			 WHEN DATEPART(dw, @fecha) = 2 THEN 'Lunes '+ CONVERT(CHAR(2), DATEPART(dd, @fecha))
			 WHEN DATEPART(dw, @fecha) = 3 THEN 'Martes '+ CONVERT(CHAR(2), DATEPART(dd, @fecha))
			 WHEN DATEPART(dw, @fecha) = 4 THEN 'Miércoles '+ CONVERT(CHAR(2), DATEPART(dd, @fecha))
			 WHEN DATEPART(dw, @fecha) = 5 THEN 'Jueves '+ CONVERT(CHAR(2), DATEPART(dd, @fecha))
			 WHEN DATEPART(dw, @fecha) = 6 THEN 'Viernes ' + CONVERT(CHAR(2), DATEPART(dd, @fecha))
			 WHEN DATEPART(dw, @fecha) = 7 THEN 'Sábado ' + CONVERT(CHAR(2), DATEPART(dd, @fecha))
		END)

	SET @mes = (
		CASE WHEN DATEPART(mm, @fecha) = 1 THEN 'Enero'
			 WHEN DATEPART(mm, @fecha) = 2 THEN 'Febrero'
			 WHEN DATEPART(mm, @fecha) = 3 THEN 'Marzo'
			 WHEN DATEPART(mm, @fecha) = 4 THEN 'Abril'
			 WHEN DATEPART(mm, @fecha) = 5 THEN 'Mayo'
			 WHEN DATEPART(mm, @fecha) = 6 THEN 'Junio'
			 WHEN DATEPART(mm, @fecha) = 7 THEN 'Julio'
			 WHEN DATEPART(mm, @fecha) = 8 THEN 'Agosto'
			 WHEN DATEPART(mm, @fecha) = 9 THEN 'Septiembre'
			 WHEN DATEPART(mm, @fecha) = 10 THEN 'Octubre'
			 WHEN DATEPART(mm, @fecha) = 11 THEN 'Noviembre'
			 WHEN DATEPART(mm, @fecha) = 12 THEN 'Diciembre'
		END
	)
	SET @fechaTexto = CONCAT(@dia, ' de ', @mes)
	RETURN @fechaTexto
END
