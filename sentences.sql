/*
1.	Obtener todas las columnas del consumidor
2.	Obtener el nombre y la ciudad de los consumidores
3.	Cuantos países distintos hay en la tabla Customer
4.	Cuente cuantos productos tienen un precio igual a 18
5.	Cuantos productos hay con precio mayor a 15 y menor a 30
6. 	Selecciones todos los registro, cuya identificación sea distinta a módulo 10
7.	Cuantos proveedores  hay que sean provenientes de Reino unido (UK) y de la ciudad Manchester
8.	Seleccione los proveedores de Japón o de España
9. 	Cuantos consumidores no son de Alemania (Germany)
10.	Ordene los registros de consumidores por pais y nombre, de manera ascendente y descendente respectivamente
11.	Insertar un registro en los consumidores
12.	Insertar UN registro en consumidores con solo el id y nombre del consumidor en la columna CustomerName
13.	Contar cuantos registros tienen null en la columna ciudad
14.	Seleccionar los consumidores que tienen una ciudad asignada
15.     Actualice el registro 93, modificando los valores nulos
16.	Elimine los registros de los consumidores, cuyo pais es Alemania
17. 	Seleccione el producto con el precio mínimo de toda la tabla Products
18.	Seleccione el producto con el precio máximo de toda la tabla Products
19.	Saque el promedio total y la suma total del precio de los productos
20.	Seleccione todos los nombre de contactos que inicien con la a
21.	Seleccionar el nombre del consumidor y el nombre del contacto, formatéelos en una sola columna
22.	Seleccione el prefijo de la columna CustomerName de la tabla customer. El prefijo de tener tres caracteres.
23. 	Seleccione el sufijo de la columna CustomerName de la tabla customer. El sufijo de tener tres caracteres.
24.	En las órdenes obtener la fecha completa, el año, el mes y el día
25.	Seleccione la fecha actual
26.	Seleccione la fecha y hora actual 


10.	Obtener el nombre del consumidor, así como la fecha e identificación del pedido.

11.	selecciona todos los clientes y todos los pedidos
12.	Selecciona todos los pedidos con información del cliente y del remitente
13. 	Seleccionará a todos los clientes y cualquier pedido que puedan tener, ordenar los registros por medio los nombres de los consumidores.
14.	Clientes que son de la misma ciudad
15.	

20.	Clasifique por tipo y sin repetición todos los clientes y proveedores

25.	Recupere la ciudad de la tabla consumidor y proveedor, no importa los duplicados.

30.	Obtenga los registros de la ciudad, el nombre del contacto y la dirección,  del consumidor y del proveedor respectivamente, los cuales deben
	de estar ordenado por ciudad y sin registros repetidos


45.	Recupere la ciudad y el país de los consumidores y proveedores que provengan de Germanía, sin registros duplicados

*/


--1 
SELECT * FROM Customers

--2
SELECT CustomerName AS 'Name', City AS 'City' FROM Customers

--3
SELECT COUNT(DISTINCT(Country)) AS 'Country' FROM Customers

--4
SELECT COUNT(*) AS 'Products' FROM Products WHERE Price = 18

--5
SELECT COUNT(*) AS 'Products' FROM Products WHERE Price > 15 AND Price < 20

--6
SELECT * FROM Customers WHERE CustomerID % 2 <> 0

--7
SELECT COUNT(*) AS 'Country' FROM Suppliers where Country = 'UK' AND City = 'Manchester'

--8
SELECT * FROM Suppliers WHERE Country = 'Japan' or Country = 'Spain'

--9
SELECT COUNT(*) FROM Customers WHERE NOT Country = 'Germany'

--10
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;

--11
INSERT INTO Customers VALUES ('0', 'Berny', 'Steven Bernal', 'Cra 4C','Cali', '753148629', 'Colombia')

--12
INSERT INTO Customers ('CustomerID', 'CustomerName') VALUES ('93', 'tEMPORAL')

--13
SELECT COUNT(*) AS 'Country is null' FROM Customers WHERE Country IS NULL

--14
SELECT * FROM Customers WHERE City NOT NULL

--15
UPDATE Customers SET ContactName = 'MR-Temporal', Address = 'Cr 85', City = 'Cali', PostalCode = 14785, Country = 'Colombia' WHERE CustomerID = 93

--16
DELETE FROM Customers WHERE Country = 'Germany'

--17
SELECT *, MIN(Price) AS 'Precio minimo' FROM Products

--18
SELECT *, MAX(Price) AS 'Precio máximo ' FROM Products

--19
SELECT AVG(Price) AS 'AVG Price', SUM(Price) AS 'SUM Price' FROM Products 

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

--20
SELECT * FROM Customers WHERE ContactName LIKE 'A%'

--21
SELECT CustomerName || ' (' || ContactName || ')' AS 'Names' FROM Customers

--22
SELECT CustomerName, SUBSTR(CustomerName, 1,3) AS 'PREFIJO' FROM Customers

--23
SELECT CustomerName, SUBSTR(CustomerName, -3) AS 'SUFIJO' FROM Customers

--24
SELECT OrderDate , STRFTIME('%Y', OrderDate) AS Year,  
STRFTIME('%m', OrderDate) AS Month,  STRFTIME('%d', OrderDate) AS Day FROM Orders

--25
SELECT DATE('now')


--ANEXO
-- SELECT TRIM(" you the best. ") AS TrimmedString
-- SELECT LTRIM("you the best.             ") AS TrimmedString
-- SELECT RTRIM("             you the best.") AS TrimmedString
-- SELECT UPPER(CustomerName) FROM Customers
-- SELECT LOWER(CustomerName) FROM Customers







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


--Pendiente
-- Wildcards

















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


