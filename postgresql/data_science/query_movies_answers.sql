-- 1.
SELECT MAX(ultima_actualizacion) AS fecha_ultima_actualizacion,
	clasificacion,
 	COUNT(*) AS cantidad_peliculas
FROM peliculas
WHERE duracion_renta > 3
GROUP BY clasificacion, ultima_actualizacion
ORDER BY fecha_ultima_actualizacion;

--2
CREATE OR REPLACE PROCEDURE test_drpcreate_procedure()
LANGUAGE SQL 
AS $$
	DROP TABLE IF EXISTS aaa;
	CREATE TABLE aaa (bbb char(5) CONSTRAINT firstkey PRIMARY KEY);
$$; 
-- Llama a la función en la parte del codigo.
CALL test_drpcreate_procedure();

--3
CREATE OR REPLACE FUNCTION test_drpcreate_function() 
RETURNS VOID
LANGUAGE plpgsql
AS $$ 
BEGIN
	DROP TABLE IF EXISTS aaa;
	CREATE TABLE aaa (bbb char(5) CONSTRAINT firstkey PRIMARY KEY, ccc char(5));
	DROP TABLE IF EXISTS aaab;
	CREATE TABLE aaaB (bbba char(5) CONSTRAINT secondkey PRIMARY KEY, ccca char(5));
END
$$

SELECT test_drpcreate_function();
