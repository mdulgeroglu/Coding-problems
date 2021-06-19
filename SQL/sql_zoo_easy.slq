-- Show the first name and the email address of customer with CompanyName 'Bike World'
SELECT FirstName, EmailAddress
FROM Customer
WHERE LOWER(CompanyName) LIKE 'bike world';


-- Show the CompanyName for all customers with an address in City 'Dallas
SELECT c.CustomerID, c.CompanyName, a.City
FROM Customer AS c 
	JOIN CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
	JOIN Address AS a ON ca.AddressID = a.AddressID
Where UPPER(a.City) LIKE 'DALLAS'


-- How many items with ListPrice more than $1000 have been sold? 
SELECT COUNT(so.SalesOrderDetailID) AS "Count"
FROM SalesOrderDetail AS so, Product AS p
WHERE so.ProductID = p.ProductID AND p.ListPrice > 1000;


-- Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight
SELECT c.CompanyName, soh.SubTotal, soh.TaxAmt, soh.Freight, soh.TotalDue
FROM SalesOrderHeader AS soh, Customer AS c
WHERE soh.CustomerID = c.CustomerID AND soh.TotalDue > 100000;


-- Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'
SELECT c.CompanyName, SUM(sod.OrderQTY)
FROM SalesLT.Customer c, SalesLT.SalesOrderHeader soh, SalesLT.SalesOrderDetail sod, SalesLT.Product p
WHERE c.CustomerID = soh.CustomerID 
	AND soh.SalesOrderID = sod.SalesOrderID 
	AND sod.ProductID = p.ProductID
	AND p.Name LIKE 'Racing Socks, L' 
	AND LOWER(c.CompanyName) LIKE 'Riding Cycles'
GROUP BY c.CompanyName;

