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
