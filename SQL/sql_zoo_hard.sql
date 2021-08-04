-- For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.
SELECT main.CustomerID, main.MainOffice, ship.Shipping
FROM (
	SELECT c.CustomerID, ca.AddressType, a.AddressLine1 AS "MainOffice"
	FROM Customer AS c 
		JOIN CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
		JOIN Address AS a ON ca.AddressID = a.AddressID
	WHERE UPPER(ca.AddressType) LIKE 'MAIN OFFICE' AND UPPER(a.City) LIKE 'DALLAS' 
	) AS main -- main office address query (limited to city = Dallas)
LEFT JOIN (
	SELECT c.CustomerID, ca.AddressType, a.AddressLine1 AS "Shipping"
	FROM Customer AS c 
		JOIN CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
		JOIN Address AS a ON ca.AddressID = a.AddressID
	WHERE UPPER(ca.AddressType) LIKE 'SHIPPING'
	) AS ship -- shipping address query
ON main.CustomerID = ship.CustomerID


-- For each order show the SalesOrderID and SubTotal calculated three ways:
-- A) From the SalesOrderHeader
-- B) Sum of OrderQty*UnitPrice
-- C) Sum of OrderQty*ListPrice 
SELECT sod.SalesOrderID, soh.SubTotal AS "SOH",  SUM(sod.OrderQty * sod.UnitPrice) AS "Qty * UnitPrice", SUM(sod.OrderQty * p.ListPrice) AS "Qty * ListPrice"
FROM SalesOrderDetail AS sod 
	JOIN SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
	JOIN Product AS p ON sod.ProductID = p.ProductID
GROUP BY sod.SalesOrderID, soh.SubTotal


--  Show the best selling item by value. 
SELECT sod.ProductID, p.Name, SUM(sod.UnitPrice * sod.OrderQty) AS "TotalValue"
FROM SalesOrderDetail AS sod
	JOIN Product AS p ON sod.ProductID = p.ProductID
GROUP BY sod.ProductID, p.Name
ORDER BY "TotalValue" DESC


/* Show how many orders are in the following ranges (in $): 
    RANGE      Num Orders      Total Value
    0-  99
  100- 999
 1000-9999
10000- 
*/

SELECT Range1 AS "RANGE", COUNT(SalesOrderID) AS "Num Orders", SUM(SubTotal) AS "Total Value"
FROM(
	SELECT 
		CASE
			WHEN (SubTotal BETWEEN 0 AND 99) 		THEN '0-99'
			WHEN (SubTotal BETWEEN 100 AND 999) 	THEN '100- 999'
			WHEN (SubTotal BETWEEN 1000 AND 9999) 	THEN '1000-9999'
			WHEN (SubTotal > 9999) 					THEN '10000+'
		END AS "Range1", 
		SalesOrderID,
		SubTotal
	FROM SalesOrderHeader
	) AS main
GROUP BY Range1


-- Identify the three most important cities. Show the break down of top level product category against city.

SELECT	a.City, 
		pc.ParentProductCategoryID,
		SUM(sod.UnitPrice * sod.OrderQty) AS Sales
FROM SalesOrderHeader 		AS soh
	JOIN SalesOrderDetail 	AS sod 	ON soh.SalesOrderID = sod.SalesOrderID
	JOIN Product 			AS p 	ON sod.ProductID = p.ProductID
	JOIN ProductCategory 	AS pc 	ON p.ProductCategoryID = pc.ProductCategoryID
	JOIN Customer 			AS c 	ON soh.CustomerID = c.CustomerID
	JOIN CustomerAddress 	AS ca 	ON c.CustomerID = ca.CustomerID
	JOIN Address 			AS a 	ON ca.AddressID = a.AddressID
WHERE a.City IN (
	SELECT temp.City FROM (
		SELECT TOP 3 a.City AS "City", SUM(soh.SubTotal) AS "tot1"
		FROM SalesOrderHeader soh 
			JOIN Customer 			AS c 	ON soh.CustomerID = c.CustomerID
			JOIN CustomerAddress 	AS ca 	ON c.CustomerID = ca.CustomerID
			JOIN Address 			AS a 	ON ca.AddressID = a.AddressID
		GROUP BY a.City
		ORDER BY tot1 DESC) AS temp
	)
GROUP BY  pc.ParentProductCategoryID, a.City




