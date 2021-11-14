
-- SELECT

--Seleccionar con un limite
SELECT * FROM <table> LIMIT 5

--Seleccionar un elemento distinto
SELECT DISTINCT <column1, column2, ...> FROM <TABLE>

--Contando
SELECT COUNT(DISTINCT COUNTRY) FROM [Customers]

--Contando con un alias
SELECT COUNT(*) AS <alias> FROM (SELECT DISTINCT(<columna>) FROM <table>)

-- WHERE OR AND NOT

SELECT * FROM <table> WHERE <conditional>

--CREATE

--Crear una tabla
CREATE TABLE <name_table>
(
  <atributo>  <type_data> <PK, Not Null, Null>
  Id      char(10)      PRIMARY KEY,
  Brand   char(10)      NOt NULL,
  Desc    varchar(750)  NULL,
)

--INSERT INTO

INSERT INTO <table> (<column1, column2, ....>) VALUES (<value1, value2, ....);





