DECLARE @num1 decimal(9, 2) = 20;
DECLARE @num2 decimal(9, 2) = 30;
DECLARE @result decimal(9, 2);

--SUMA
SET @result = @num2 + @num1; 
PRINT @result

--RESTA
SET @result = @num2 - @num1; 
PRINT @result

--PRODUCTO
SET @result = @num2 * @num1; 
PRINT @result

--DIVISION
SET @result = @num2 / @num1;
PRINT @result

--MODULO
SET @result = @num2 % @num1; 
PRINT @result

DECLARE @saludo VARCHAR(30) = 'Hola me llamo '
DECLARE @name VARCHAR(30) = 'Steven'
DECLARE @complete VARCHAR(30)

SET @complete = @saludo +' '+@name
PRINT @complete



--MAYOR
IF @num1 < @num2
	PRINT CONCAT(@num1, ' ES MAYOR A ', @num2)

--MENOR
IF @num1 < @num2
	PRINT CONCAT(@num1, ' ES MENOR A ', @num2)

--DIFERENTE
IF @num1 <> @num2
	PRINT CONCAT(@num1, ' DIFERENTE ', @num2)
