-- 1
SELECT * FROM platzi.alumnos FETCH FIRST 1 ROWS ONLY;

SELECT * FROM platzi.alumnos limit 1;

SELECT * FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, * FROM platzi.alumnos) 
AS alumnos_with_arow_nums WHERE row_id = 1;
