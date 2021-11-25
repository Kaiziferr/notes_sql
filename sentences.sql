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
27.	Seleccione cualquier consumidor que pretenezca alguno de estos paises: Germany, Mexico o France
28.	Seleccione cualquier consumidor que no pretenezca alguno de estos paises: Germany, Mexico o France
29.	Seleccionar los consumidores que tengan la misma ciudad que los proveedores
30.	Seleccione los productos que tengan un precio entre 20 y 40
31.	Seleccione los productos que no tengan un precio entre 20 y 40
32.	Seleccione los productos que tengan un precio entre 9 y 20. Además, que el id del producto no sea 1,2 y 3.
33.	Seleccione los productos entre los productos cuyo nombres son Ikura y Maxilaku respectivamente. Ordenelos por nombre.
34.	Cuente cuantas ordenes hay entre 1996-07-08 y 1996-07-19	
35.	Cuente cuantas ordenes hay en el año 1997
36.	Obtenga el nombre del consumidor y la dirección. A esta última adiciónele el código postal, la ciudad y el país.
37.	Selecciones las órdenes  del consumidor Around the Horn. Obtenga las columnas id y la fecha de la orden, asi como el nombre del consumidor
38.	Encuentre el id y la fecha de la orden, y el nombre del consumidor de  aquellos clientes que tengan órdenes asociadas
39.	Seleccione los consumidores y empleados que se relacionen por la orden. De esta consulta es necesario obtener el id de la orden, el nombre 
	del consumidor y el nombre completo del empleado
40.	Selecciones los consumidores que pueden o no tener órdenes asociadas
41.	Selecciones el id y nombre de los consumidores que no tengan órdenes asociadas
42.	Seleccione parejas de consumidores que sean de la misma ciudad
43.	Seleccione parejas de consumidores que sean de la misma ciudad, eliminando las parejas repetidas
44.	Seleccione el id, nombre y el nombre de contacto y proveedores. Además, en una columna llamada Info adicione la dirección, la ciudad, el código postal y 
	el país. No importa la redundancia
45.	Seleccione el id, nombre y el nombre de contacto y proveedores. Además, en una columna llamada Info adicione la dirección, la ciudad, el código postal y 
	el país. Elimine redundancias

46.	Obtenga los nombres de los proveedores y consumidores de Alemania, en una sola tabla, sin especificar su distinción y sin redundancias






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
SELECT DATE('now') AS 'FECHA ACTUAL'

--26
SELECT DATE('now') AS 'Fecha Actual', STRFTIME('%H %M %S %s', 'now') AS 'Tiempo Actual'

--27
SELECT * FROM Customers WHERE Country IN ('Germany', 'Mexico', 'France')

--28
SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'Mexico', 'France')

--29
SELECT * FROM Customers WHERE City IN (SELECT City FROM Suppliers)

--30
SELECT * FROM Products WHERE Price BETWEEN 20 AND 40

--31
SELECT * FROM Products WHERE Price NOT BETWEEN 20 AND 40

--32
SELECT * FROM Products WHERE Price BETWEEN 20 AND 40 IN (1,2,3)

--33
SELECT * FROM Products WHERE ProductName BETWEEN 'Ikura' AND 'Maxilaku' ORDER BY ProductName

--34
SELECT COUNT(*) AS 'PRODUCTOS POR FECHA' FROM Orders WHERE OrderDate BETWEEN '1996-07-08' AND '1996-07-19'

--35
SELECT COUNT(*) AS 'Productos de 1997' FROM (SELECT OrderDate, STRFTIME('%Y', OrderDate) AS Year FROM Orders) WHERE Year = '1997'

--36
SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;

--37
SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers c, Orders o WHERE c.CustomerName = 'Around the Horn' AND c.CustomerID = o.CustomerID

--38
SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID 

--39
SELECT o.OrderID, c.CustomerName, e.FirstName || ' ' || e.LastName AS FULL_NAME FROM ((ORDERS o INNER JOIN Customers c ON o.CustomerID = c.CustomerID)
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID)

--40
SELECT * FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID

--41
SELECT c.CustomerID, c.CustomerName FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID WHERE OrderID IS NULL

--42
SELECT c1.CustomerID AS id_c1, c2.CustomerID AS id_c2, 
c1.CustomerName AS 'Nombre 1 Consumidor', 
c2.CustomerName AS 'Nombre 2 Consumidor', 
c1.City FROM Customers c1, Customers c2 WHERE c1.CustomerID<>c2.CustomerID AND c1.City = c2.City

--43
SELECT c1.CustomerID AS id_c1, c2.CustomerID AS id_c2, 
c1.CustomerName AS 'Nombre 1 Consumidor', 
c2.CustomerName AS 'Nombre 2 Consumidor', 
c1.City FROM Customers c1, Customers c2 WHERE c1.CustomerID<>c2.CustomerID AND c1.City = c2.City AND c1.CustomerID > c2.CustomerID

--44
SELECT c.CustomerID AS 'Id', c.CustomerName AS 'Name', c.ContactName, c.Address||' '||c.City||' '||c.PostalCode||' '||c.Country AS 'Info' FROM Customers c
UNION ALL
SELECT s.SupplierID AS 'Id', s.SupplierName AS 'Name', s.ContactName, s.Address||' '||s.City||' '||s.PostalCode||' '||s.Country AS 'Info' FROM Suppliers s

--45
SELECT c.CustomerID AS 'Id', c.CustomerName AS 'Name', c.ContactName, c.Address||' '||c.City||' '||c.PostalCode||' '||c.Country AS 'Info' FROM Customers c
UNION
SELECT s.SupplierID AS 'Id', s.SupplierName AS 'Name', s.ContactName, s.Address||' '||s.City||' '||s.PostalCode||' '||s.Country AS 'Info' FROM Suppliers s

--46
SELECT c.CustomerName AS 'Name' FROM Customers c
WHERE c.Country='Germany'
UNION
SELECT s.SupplierName AS 'Name' FROM Suppliers s
WHERE s.Country='Germany'


--ANEXO
-- SELECT TRIM(" you the best. ") AS TrimmedString
-- SELECT LTRIM("you the best.             ") AS TrimmedString
-- SELECT RTRIM("             you the best.") AS TrimmedString
-- SELECT UPPER(CustomerName) FROM Customers
-- SELECT LOWER(CustomerName) FROM Customers
-- Cree una tabla con el gentilicio de los consumidores provenientes de Alemania, Mexico y UK
SELECT CustomerID, CustomerName, ContactName, City,
CASE Country
WHEN 'Germany' THEN 'ALEMAN'
WHEN 'Mexico' THEN 'MEXICANO'
WHEN 'UK' THEN 'BRITANICO'
ELSE 'Other'
END AS 'GENTILICIO'
FROM Customers


SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

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


