-- 1
SELECT * FROM platzi.alumnos FETCH FIRST 1 ROWS ONLY;

SELECT * FROM platzi.alumnos limit 1;

SELECT * FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, * FROM platzi.alumnos) 
AS alumnos_with_arow_nums WHERE row_id = 1;

-- 2
SELECT * FROM platzi.alumnos FETCH FIRST 5 ROWS ONLY;

SELECT * FROM platzi.alumnos limit 5;

SELECT * FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, * FROM platzi.alumnos) 
AS alumnos_with_arow_nums WHERE row_id < 6;

--3
SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
SELECT COUNT(DISTINCT colegiatura) 
FROM platzi.alumnos a2
where a1.colegiatura <= a2.colegiatura
);

SELECT DISTINCT colegiatura
FROM platzi.alumnos as a1 order by 
colegiatura desc OFFSET 1;
-- 4
SELECT * FROM platzi.alumnos
OFFSET(
	SELECT COUNT(*)/2
	FROM platzi.alumnos
);

-- 5
SELECT * FROM platzi.alumnos
WHERE id IN (10, 80, 150, 300, 600, 800);

-- 6
SELECT * FROM 
( SELECT * FROM platzi.alumnos
 WHERE tutor_id = 30
) as alumnos_profesor_30;
