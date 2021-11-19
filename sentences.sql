/*
1.	Obtener todas las columnas del consumidor
2.	Cuantos paises distintos hay en la tabla Customer
6. 	Obtener el nombre y la ciudad de los consumidores



8.	Cuente cuantos productos tienen un precio igual a 18

10.	Obtener el nombre del consumidor, así como la fecha e identificación del pedido.
11.	selecciona todos los clientes y todos los pedidos
12.	Selecciona todos los pedidos con información del cliente y del remitente
13. 	Seleccionará a todos los clientes y cualquier pedido que puedan tener, ordenar los registros por medio los nombres de los consumidores.
14.	Clientes que son de la misma ciudad
15.	Cuantos productos hay con precio mayor a 15 y menor a 30

20.	Clasifique por tipo y sin repetición todos los clientes y proveedores

25.	Recupere la ciudad de la tabla consumidor y proveedor, no importa los duplicados.

30.	Obtenga los registros de la ciudad, el nombre del contacto y la dirección,  del consumidor y del proveedor respectivamente, los cuales deben
	de estar ordenado por ciudad y sin registros repetidos


45.	Recupere la ciudad y el país de los consumidores y proveedores que provengan de Germanía, sin registros duplicados



*/


-- 1
SELECT * FROM Customers

-- 2
SELECT COUNT(DISTINCT(Country)) AS 'N_Country' FROM Customers
SELECT COUNT(*) FROM (SELECT DISTINCT(Country) FROM Customers)

-- 6
SELECT CustomerName, City FROM Customers

-- 8
SELECT COUNT(*) AS 'Producto' FROM Products WHERE price = 18

-- 10
SELECT o.OrderID, c.CustomerName, o.OrderDate  FROM Orders o INNER JOIN Customers c ON c.CustomerID = o.CustomerID

-- 11
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

-- 12
SELECT o.OrderID, c.CustomerName, s.ShipperName 
FROM ((Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID) 
INNER JOIN Shippers s ON o.ShipperID = s.ShipperID)

-- 13
SELECT c.CustomerName, o.OrderID FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID ORDER BY c.CustomerName

-- 14
SELECT a.CustomerName AS CustomerName1, b.CustomerName AS CustomerName2, a.City
FROM Customers a, Customers b
WHERE a.CustomerID <> b.CustomerID AND a.City = b.City
ORDER BY a.City

-- 15
SELECT COUNT(*) AS 'Producto' FROM Products WHERE price > 15 AND price < 30

-- 20
SELECT 'Customers' AS Type, ContactName, City, Country FROM Customers UNION SELECT 'Supplier', ContactName, City, Country FROM Suppliers;

--25
SELECT City FROM Customers UNION ALL SELECT City FROM Suppliers ORDER BY City

--30
SELECT City FROM Customers UNION SELECT City FROM Suppliers ORDER BY City

--45
SELECT City, Country FROM Customers WHERE Country = 'Germany' UNION SELECT City, Country FROM Suppliers WHERE Country = 'Germany'


















-- SELECT
SELECT * FROM <table>

-- LIMIT
SELECT * FROM <table_name> LIMIT 5

-- DISTINCT
SELECT DISTINCT <column1, column2, ...> FROM <table_name>

-- AVERAGE
SELECT AVG(<column>) AS <alias> FROM <table_name>

-- COUNT
--Contando
SELECT COUNT(DISTINCT <column>) FROM <table_name>
--Contando con un alias
SELECT COUNT(*) AS <alias> FROM (SELECT DISTINCT(<column>) FROM <table_name>)

-- MIN
SELECT MIN(<column>) AS <alias> FROM <table_name>

-- MAX
SELECT MAX(<column>) AS <alias> FROM <table_name>

-- SUM
SELECT SUM(<column>) AS <alias> FROM <table_name>

-- SELECT AVG(<column>) AS <alias>, MAX(<column>) AS <alias>, MIN(<column>) AS <alias>, SUM(<column>) AS <alias> FROM <table_name>

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
SELECT <column1, column2, ...> FROM <table_name> WHERE <condition> ORDER BY <column1, column2, ...> ASC
SELECT <column1, column2, ...> FROM <table_name> WHERE <condition> ORDER BY <column1, column2, ...> DESC

-- MATH OPERATIONS
/*
ORDER OF OPERATIONS
	PARENTHESES
	EXPONENTS
	MULTIPLICATION
	DIVISION
	ADDITION
	SUBTRACTION
*/
SELECT <column1, column2, ...> <math_operations> AS <alias> FROM <table_name>

-- GROUP BY 
SELECT <funcion_agregada>, <column1, column2, ...> FROM <table_name> GROUP BY <column1>
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC

-- HAVING
-- La clausula HAVING se agregó a SQL porque la WHERE palabra clave no se puede usar con funciones agregadas.

SELECT <funcion_agregada>, <column1, column2, ...> FROM <table_name> GROUP BY <column1> HAVING <funcion_agregada><condition> 
SELECT <funcion_agregada>, <column1, column2, ...> FROM <table_name> GROUP BY <column1> HAVING COUNT(<column1>)>5
SELECT <funcion_agregada> AS <alias>, <column1, column2, ...> FROM <table_name> GROUP BY <column1> HAVING <alias><condition>
--busque los álbumes con 12 o más pistas.
SELECT COUNT(*) FROM (select count(TrackId) from tracks group by AlbumId HAVING Count(TrackId)>11)
--muestra el número de pedidos realizados por cada cliente (pista: se encuentra en la tabla de facturas) y ordena el resultado por el número de pedidos en orden descendente .
select count(*), * from invoices group by CustomerId order by count(InvoiceId) desc
--https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png


--CREATE

--Crear una tabla
CREATE TABLE <name_table>
(
  <atributo>  <type_data> <PK, Not Null, Null>
  Id      char(10)      PRIMARY KEY,
  Brand   char(10)      NOt NULL,
  Desc    varchar(750)  NULL
)

--Crear una tabla temporal
CREATE TEMPORARY TABLE <name_table> AS
(
	SELECT * FROM <tabla> WHERE <condition>
)

--INSERT INTO

INSERT INTO <table> (<column1, column2, ....>) VALUES (<value1, value2, ....);


-- JOIN

-- Seleccionar el id del pedido, id del consumidor y fecha del pedido.
SELECT Orders.OrderID, Customers.CustomerID, Orders.OrderDate FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID; 


