-- Se elimina cuando el motor se reinicia
-- CREATE TABLE
CREATE TABLE #mitabla(
	id int IDENTITY(1,1),
	name VARCHAR(50), 
	lastname VARCHAR(50))

INSERT INTO #mitabla VALUES('KIRBY', 'STAR')
INSERT INTO #mitabla VALUES('LUIGI', 'BROS')
INSERT INTO #mitabla VALUES('SAMUS', 'ARAN')

SELECT * FROM #mitabla;

-- DELATE TABLE
DROP TABLE #mitabla
