-- 1. Declarare dos variables, con nombre y apellido, al nombre sacarle el prefijo de 3 caracteres y al apellido el sufijo de tres caracteres.
DECLARE @name VARCHAR(10);
DECLARE @lastname VARCHAR(10);
SET @name = 'SANTOS';
SET @lastname = 'PANTOS';

PRINT LEFT(@name, 3)
PRINT RIGHT(@lastname, 3)

--2 Obtener un listado de las iniciales de los pacientes, leyendo los campos nombre y apellido, utilizando la función LEFT y el operador + para concatenar las iniciales y obtener el resultado.



