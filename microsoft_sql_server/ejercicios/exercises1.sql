-- 1. Declarare dos variables, con nombre y apellido, al nombre sacarle el prefijo de 3 caracteres y al apellido el sufijo de tres caracteres.
DECLARE @name VARCHAR(10);
DECLARE @lastname VARCHAR(10);
SET @name = 'SANTOS';
SET @lastname = 'PANTOS';

PRINT LEFT(@name, 3)
PRINT RIGHT(@lastname, 3)


-- 2. Declare una variable, y determine la longitud de sus caracteres
DECLARE @name VARCHAR(10);
SET @name = 'steven'
PRINT CONCAT(@name,', ',LEN(@name))

-- 3. Declare dos variables (nombre, apellido), al nombre ponerlo en minúscula y al apellido en mayúscula.
DECLARE @name VARCHAR(10);
DECLARE @lastname VARCHAR(10);

SET @name = 'TOM';
SET @lastname = 'jerry';

PRINT UPPER(@lastname) + ' ' + LOWER(@name)

-- 4. Declare una variable donde hallan tres variables separadas por espacio, remplace el espacio por guion bajo.
DECLARE @texto VARCHAR(15); 
SET @texto = 'Leche Pan Carne';
SELECT REPLACE(@texto, ' ', '_')

--5. Defina una variable con un valor, y agréguele cinco ceros por delante

DECLARE @texto VARCHAR(5);
SET @texto = 'AK865';
PRINT CONCAT(REPLICATE('0', 5), @texto ) 

  
DECLARE @texto VARCHAR(5);
SET @texto = 'ALTA';
PRINT REPLICATE(@texto, 5)

--6. Obtener la fecha del servidor y la del meridiano.
SELECT GETDATE() -- HORA DEL SISTEMA DONDE ESTA INSTALADO EL MOTOR
SELECT GETUTCDATE() -- HORA DEL MERIDIANO

--7. Sumar dos años a la fecha actual, restar 3 meses y restar 30 minutos
SELECT DATEADD(year, 2, GETDATE())
SELECT DATEADD(mm, -3, GETDATE())
SELECT DATEADD(mi, -30, GETDATE())

--8. Sacar la diferencia entre la fecha actual y una del futuro. Obtener la diferencia en minutos y días de la fecha del ordenador y la del meridiano
SELECT DATEDIFF(year, GETDATE(), '20291103')
SELECT DATEDIFF(mi, GETUTCDATE(), GETDATE())
SELECT DATEDIFF(dd, GETUTCDATE(), GETDATE())

--9 Obtener partes del día

SELECT DATEPART(day, GETDATE())
SELECT DATEPART(dw, GETDATE())
SELECT DATEPART(DAYOFYEAR, GETDATE())
SELECT DATEPART(year, GETDATE())
SELECT DATEPART(month, GETDATE())

-- 10 Imprimir un mensaje si es una fecha
IF ISDATE('20290132') = 1
	PRINT 'IS DATE'

ELSE 
	PRINT 'NOT IS DATE'

--11 Castee en tiempo de ejecución el valor de una variable y el valor de una tabla
DECLARE @moneyy FLOAT;
SET @moneyy = 25.8;
SELECT CAST(@moneyy AS INT) AS MONEDA;


SELECT CAST(idPaciente as money) AS FLOAT FROM CentroMedico.dbo.Paciente;

--12 Convertir la fecha a los siguientes formatos a char 20 caracteres, al formato 112
DECLARE @fechita DATETIME;
SET @fechita = GETDATE();
PRINT @fechita
PRINT CONVERT(CHAR(20), @fechita)
PRINT CONVERT(CHAR(20), @fechita, 112)
PRINT CONVERT(CHAR(20), @fechita, 104)
