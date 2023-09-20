SELECT dbo.sumaNumeros(5, 8)
ALTER FUNCTION sumaNumeros(@var1 INT, @var2 INT)
RETURNS INT

AS 

BEGIN
	DECLARE @res INT;
	SET @res = @var1 + @var2;
	RETURN @res;
END
