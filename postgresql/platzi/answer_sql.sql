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

--7
SELECT * FROM 
( SELECT * FROM platzi.alumnos
 WHERE tutor_id != 30
) as alumnos_profesor_no30;

--8
SELECT EXTRACT (YEAR FROM fecha_incorporacion) AS anio_incorporacion FROM platzi.alumnos;
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion FROM platzi.alumnos;

--9
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion, DATE_PART('MONTh', fecha_incorporacion) AS mes_incorporacion, DATE_PART('DAY', fecha_incorporacion) AS dia_incorporacion FROM platzi.alumnos;

--10
SELECT DATE_PART('HOUR', fecha_incorporacion) as hora_incorporacion, DATE_PART('MINUTE', fecha_incorporacion) AS minutos_incorporacion, DATE_PART('SECOND', fecha_incorporacion) AS segundos_incorporacion FROM platzi.alumnos;

--11
SELECT * FROM platzi.alumnos WHERE EXTRACT(YEAR FROM fecha_incorporacion) = 2019;
SELECT * FROM platzi.alumnos WHERE DATE_PART('YEAR', fecha_ingreso) = 2019;
SELECT * FROM ( SELECT *, DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion FROM platzi.alumnos) AS alumnos_con_anio WHERE anio_incorporacion = 2019;

--12
SELECT (platzi.alumnos.*)::text FROM platzi.alumnos;

--13
SELECT int4range(1, 20) @> 3;

--14
SELECT numrange(11.1, 19.9) && numrange(20.0, 30.0);

--15
SELECT numrange(
	(SELECT MIN(tutor_id) FROM platzi.alumnos),
	(SELECT MAX(tutor_id) FROM platzi.alumnos)
) * 
numrange(
	(SELECT MIN(carrera_id) FROM platzi.alumnos),
	(SELECT MAX(carrera_id) FROM platzi.alumnos)
); 


--16
SELECT CONCAT(a.nombre, ' ', a.apellido) AS alumno,
	   CONCAT(t.nombre, ' ', t.apellido)  AS tutor
FROM platzi.alumnos AS a 
INNER JOIN platzi.alumnos AS t 
ON a.tutor_id = t.id;

--17
SELECT 
	   CONCAT(t.nombre, ' ', t.apellido)  AS tutor,
	   COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a 
INNER JOIN platzi.alumnos AS t 
ON a.tutor_id = t.id 
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC;

--18
SELECT carrera_id, COUNT(*) AS numero_alumnos
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY numero_alumnos DESC;


SELECT  c.carrera, count(*) AS numero_alumnos  
FROM platzi.alumnos AS a
INNER JOIN platzi.carreras AS c
ON a.carrera_id = c.id
GROUP BY c.carrera
ORDER BY numero_alumnos DESC;
;
--19
SELECT *,
AVG(colegiatura) OVER (PARTITION by carrera_id) 
FROM platzi.alumnos;

--20
SELECT *
FROM generate_series(1,8);

SELECT *
FROM generate_series(5,1, -2);

SELECT *
FROM generate_series(1,8,2);

--21
SELECT * 
FROM generate_series('2020-09-01 00:00:00'::timestamp, 
					'2020-09-04 12:00:00', '10 hours')
