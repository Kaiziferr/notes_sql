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
