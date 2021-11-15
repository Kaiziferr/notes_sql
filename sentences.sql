
-- SELECT
SELECT * FROM <table>
--Seleccionar con un limite
SELECT * FROM <table_name> LIMIT 5
--Seleccionar un elemento distinto
SELECT DISTINCT <column1, column2, ...> FROM <table_name>
--Contando
SELECT COUNT(DISTINCT <column>) FROM <table_name>
--Contando con un alias
SELECT COUNT(*) AS <alias> FROM (SELECT DISTINCT(<column>) FROM <table_name>)
-- WHERE
SELECT * FROM <table_name> WHERE <condition>

/*	
	|OPERATOR	|DESCRIPTION			|
	|=		|EQUAL				|
	|<>,!=		|NOT EQUAL			|
	|>		|GREATER THAN			|
	|<		|LESS THAN			|
	|>=		|GREATER THAN OR EQUAL		|
	|<=		|LESS THAN OR EQUAL		|
	|BETWEEN	|				|
	|IS NULL	|				|
*/


-- BETWEEN
SELECT * FROM <table_name> WHERE <column> BETWEEN <value1> AND <value2>
-- NULL
SELECT * FROM <table_name> WHERE <column> IS NULL
-- NOT NULL
SELECT * FROM <table_name> WHERE <column> NOT NULL
-- IN
SELECT * FROM <table_name> WHERE <column> IN (value1, value2, value3, ...)
SELECT * FROM <table_name> WHERE <column> IN (SELECT <column> FROM <table_name>)
-- LIKE
SELECT * FROM <table_name> WHERE <column> LIKE <pattern>
/*
	%	Representa cero, uno o varios caracteres
	_	Representa un solo caracter
	
	Any Examples
	
	|'a%'		|Inicia con a									|
	|'%a'		|Finaliza con a									|
	|'%of%'		|Encuentra un valor que contenga la sentencia 'of' en alguna parte		|
	|'_r%'		|Segunda posicion debe ser 'r'							|
	|'a__%'		|Encuentra valor que inicia con 'a' y que tenga menos de tres caracteres	|
	|'a%n'		|Inicia con 'a' y termina con 'n'						|
*/

-- ORDER BY
SELECT <column1, column2, ...> FROM <column> WHERE <condition> ORDER BY <column1, column2, ...> ASC
SELECT <column1, column2, ...> FROM <column> WHERE <condition> ORDER BY <column1, column2, ...> DESC



--CREATE

--Crear una tabla
CREATE TABLE <name_table>
(
  <atributo>  <type_data> <PK, Not Null, Null>
  Id      char(10)      PRIMARY KEY,
  Brand   char(10)      NOt NULL,
  Desc    varchar(750)  NULL,
)

--Crear una tabla temporal
CREATE TEMPORARY TABLE <name_table> AS
(
	SELECT * FROM <tabla> WHERE <condition>
)

--INSERT INTO

INSERT INTO <table> (<column1, column2, ....>) VALUES (<value1, value2, ....);





