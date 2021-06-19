-- A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.

SELECT sod.SalesOrderID, soh.CustomerID, SUM(sod.OrderQty)
FROM SalesOrderDetail AS sod, SalesOrderHeader AS soh
WHERE sod.SalesOrderID = soh.SalesOrderID
GROUP BY sod.SalesOrderID, soh.CustomerID
HAVING SUM(sod.OrderQty) = 1


-- Where did the racing socks go? List the product name and the CompanyName for all Customers who ordered ProductModel 'Racing Socks'.

SELECT c.CompanyName,  p.Name AS "Product Name"
FROM SalesOrderHeader 		AS soh 
	JOIN SalesOrderDetail 	AS sod 	ON soh.SalesOrderID = sod.SalesOrderID
	JOIN Product 			AS p 	ON sod.ProductID = p.ProductID
	JOIN ProductModel 		AS pm	ON p.ProductModelID = pm.ProductModelID
	JOIN Customer 			AS c 	ON soh.CustomerID = c.CustomerID
WHERE UPPER(pm.Name) LIKE 'RACING SOCKS'

-- Show the product description for culture 'fr' for product with ProductID 736. 
SELECT pmpd.Culture, pd.Description
FROM ProductDescription AS pd JOIN ProductModelProductDescription AS pmpd ON pd.ProductDescriptionID = pmpd.ProductDescriptionID
	JOIN ProductModel AS pm ON pm.ProductModelID = pmpd.ProductModelID
	JOIN Product AS p ON p.ProductModelID = pm.ProductModelID
WHERE pmpd.Culture = 'fr'


-- Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the CompanyName and the SubTotal and the total weight of the order.
SELECT c.CompanyName, soh.SubTotal, SUM(p.Weight * sod.OrderQty) AS "Total Weight"
FROM SalesOrderHeader 		AS soh
	JOIN Customer 			AS c 	ON soh.CustomerID = c.CustomerID
	JOIN SalesOrderDetail 	AS sod	ON soh.SalesOrderID = sod.SalesOrderID
	JOIN Product 			AS p	ON sod.ProductID = p.ProductID
GROUP BY c.CompanyName, soh.SubTotal
ORDER BY soh.SubTotal DESC


-- How many products in ProductCategory 'Cranksets' have been sold to an address in 'London'?
SELECT SUM(sod.OrderQty) AS "Cranksets/London"
FROM SalesOrderHeader		AS soh
	JOIN Customer			AS c		ON soh.CustomerID = c.CustomerID
	JOIN CustomerAddress	AS ca		ON c.CustomerID = ca.CustomerID
	JOIN Address			AS a		ON ca.AddressID = a.AddressID
	JOIN SalesOrderDetail	AS sod		ON soh.SalesOrderID = sod.SalesOrderID
	JOIN Product			AS p		ON sod.ProductID = p.ProductID
	JOIN ProductCategory	AS pc		ON p.ProductCategoryID = pc.ProductCategoryID
WHERE UPPER(pc.Name) LIKE 'CRANKSETS' AND UPPER(a.City) LIKE 'LONDON'





