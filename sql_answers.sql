
--1 
SELECT * FROM CUSTOMERS;

--2
SELECT CUSTOMERNAME AS "NAME", CITY AS "CITY" FROM CUSTOMERS;

--3
SELECT COUNT(DISTINCT(COUNTRY)) AS "COUNT_COUNTRY" FROM CUSTOMERS;

--4
SELECT COUNT(*) AS "PRODUCTS_PRICE_18" FROM PRODUCTS WHERE PRICE = 18;

--5
SELECT COUNT(*) AS "PRODUCTS_PRICE_15_30" FROM PRODUCTS WHERE PRICE > 15 AND PRICE < 30;

--6
SELECT * FROM CUSTOMERS WHERE CUSTOMERID % 10 <> 0;

--7
SELECT * FROM [Customers] WHERE Country IN ("Germany", "Mexico", "France");

--8
SELECT * FROM [Customers] WHERE Country NOT IN ("Germany", "Mexico", "France");

--9
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;

--10
INSERT INTO Customers VALUES ('0', 'Berny', 'Steven', 'Cra 4C','Bogota', '753148629', 'Colombia')

--11
INSERT INTO Customers ('CustomerID', 'CustomerName') VALUES ('93', 'tEMPORAL')

--12
SELECT COUNT(*) AS 'Country is null' FROM Customers WHERE Country IS NULL

--13
SELECT * FROM Customers WHERE City NOT NULL

--14
UPDATE Customers SET CustomerName = 'new customer name', ContactName = 'new contact name', Address = 'new address', 
City = 'new city', PostalCode = 'new PostalCode', country = 'new country' WHERE CustomerID = 2

--15
DELETE FROM Customers WHERE Country = 'Germany'

--16
SELECT *, MIN(Price) AS 'Precio minimo' FROM Products

--17
SELECT *, MAX(Price) AS 'Precio máximo ' FROM Products

--18
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

--19
SELECT * FROM Customers WHERE ContactName LIKE 'A%'

--20
SELECT '('|| CustomerName ||' '||ContactName || ')' AS 'Names' FROM Customers

-- 21
SELECT CustomerName, SUBSTR(CustomerName, 1,3) AS 'PREFIJO' FROM Customers

-- 22
SELECT CustomerName, SUBSTR(CustomerName, -3) AS 'SUFIJO' FROM Customers
	
--23
SELECT OrderDate , STRFTIME('%Y', OrderDate) AS Year,  
STRFTIME('%m', OrderDate) AS Month,  STRFTIME('%d', OrderDate) AS Day FROM Orders

--24
SELECT DATE('now') AS 'FECHA ACTUAL'

--25
SELECT DATE('now') AS 'Fecha Actual', STRFTIME('%H %M %S %s', 'now') AS 'Tiempo Actual'
