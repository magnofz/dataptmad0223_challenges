---------------------------------------------------------------------------

LAB 03 - Challenge 1

---------------------------------------------------------------------------

SELECT
c.FirstName + ' ' + c.LastName AS 'Customer Full Name',
p.Name AS 'Product Name'

FROM [SalesLT].[Customer] AS c
INNER JOIN [SalesLT].[SalesOrderHeader] AS SoH ON c.CustomerID = SoH.CustomerID
INNER JOIN [SalesLT].[SalesOrderDetail] AS SoD ON SoH.SalesOrderID = SoD.SalesOrderID
INNER JOIN [SalesLT].[Product] AS p ON SoD.ProductID = p.ProductID

ORDER BY 'Customer Full Name', 'Product Name'

---------------------------------------------------------------------------

LAB 03 - Challenge 2

---------------------------------------------------------------------------

SELECT
pm.Name AS 'Product Model',
pd.Description AS 'Description'

FROM [SalesLT].[ProductModel] AS pm
INNER JOIN [SalesLT].[Product] AS p ON p.ProductModelID = pm.ProductModelID
INNER JOIN [SalesLT].[ProductModelProductDescription] AS pmpd ON pm.ProductModelID = pmpd.ProductModelID
INNER JOIN [SalesLT].[ProductDescription] AS pd ON pmpd.ProductDescriptionID = pd.ProductDescriptionID

WHERE
p.ProductID = 710 AND
pmpd.Culture = 'ar'

---------------------------------------------------------------------------

LAB 03 - Challenge 3 (BONUS)

---------------------------------------------------------------------------

SELECT
p.Name,
COUNT(SoD.ProductID) AS 'Total Orders'

FROM [SalesLT].[Product] AS p
INNER JOIN [SalesLT].[SalesOrderDetail] AS SoD ON p.ProductID = SoD.ProductID

GROUP BY p.Name

ORDER BY 'Total Orders' DESC

---------------------------------------------------------------------------

LAB 04 - Challenge 1

---------------------------------------------------------------------------

SELECT
p.Name,
COUNT(SoH.SalesOrderID) AS 'Total Orders'

FROM [SalesLT].[SalesOrderHeader] AS SoH
INNER JOIN [SalesLT].[SalesOrderDetail] AS SoD ON SoH.SalesOrderID = SoD.SalesOrderID
INNER JOIN [SalesLT].[Product] AS p ON SoD.ProductID = p.ProductID

GROUP BY p.Name

ORDER BY 'Total Orders' DESC

---------------------------------------------------------------------------

LAB 04 - Challenge 2

---------------------------------------------------------------------------

SELECT
pc.Name,
p.Name,
SUM(SoD.OrderQty) AS 'Total Qty'

FROM [SalesLT].[SalesOrderDetail] AS SoD
INNER JOIN [SalesLT].[Product] AS p ON SoD.ProductID = p.ProductID
INNER JOIN [SalesLT].[ProductCategory] AS pc ON p.ProductCategoryID = pc.ProductCategoryID

GROUP BY pc.Name, p.Name

ORDER BY pc.Name, p.Name

---------------------------------------------------------------------------

LAB 04 - Challenge 3

---------------------------------------------------------------------------

SELECT
pc.Name AS 'Category',
p.Name AS 'Product',
SUM(SoD.OrderQty) AS 'Total Qty'

FROM [SalesLT].[SalesOrderDetail] AS SoD
INNER JOIN [SalesLT].[Product] AS p ON SoD.ProductID = p.ProductID
INNER JOIN [SalesLT].[ProductCategory] AS pc ON p.ProductCategoryID = pc.ProductCategoryID

GROUP BY GROUPING SETS ((pc.Name), (pc.Name, p.Name))

ORDER BY 'Category', 'Product'

---------------------------------------------------------------------------

LAB 04 - Challenge 4 (BONUS)

---------------------------------------------------------------------------

SELECT
pc.Name AS 'Category',
p.Name AS 'Product',
SUM(SoD.OrderQty) AS 'Total Qty'

FROM [SalesLT].[SalesOrderDetail] AS SoD
INNER JOIN [SalesLT].[Product] AS p ON SoD.ProductID = p.ProductID
INNER JOIN [SalesLT].[ProductCategory] AS pc ON p.ProductCategoryID = pc.ProductCategoryID
INNER JOIN [SalesLT].[SalesOrderHeader] AS SoH ON SoD.SalesOrderID = SoH.SalesOrderID

GROUP BY GROUPING SETS ((pc.Name), (pc.Name, p.Name)) HAVING COUNT(DISTINCT SoH.SalesOrderID) >=8

ORDER BY 'Category', 'Product'

---------------------------------------------------------------------------

LAB 05 - Challenge 1

---------------------------------------------------------------------------

SELECT p.ProductID, pc.Name AS 'Category', p.Name AS 'Product', p.[Size]
, ROW_NUMBER() OVER (PARTITION BY p.ProductCategoryID ORDER BY p.Size) AS 'Row Number Per Category & Size'
, RANK() OVER (PARTITION BY p.ProductCategoryID ORDER BY p.Size) AS 'Rank Per Category & Size'
, DENSE_RANK() OVER (PARTITION BY p.ProductCategoryID ORDER BY p.Size) AS 'Dense Rank Per Category & Size'
, NTILE(2) OVER (PARTITION BY p.ProductCategoryID ORDER BY p.Name) AS 'NTile Per Category & Name'
, SUM(p.StandardCost) OVER() AS 'Standard Cost Grand Total'
, SUM(p.StandardCost) OVER(PARTITION BY p.ProductCategoryID) AS 'Standard Cost Per Category'
, LAG(p.Name, 1, '-- NOT FOUND --') OVER(PARTITION BY p.ProductCategoryID ORDER BY p.Name) AS 'Previous Product Per Category'
, LEAD(p.Name, 1, '-- NOT FOUND --') OVER(PARTITION BY p.ProductCategoryID ORDER BY p.Name) AS 'Next Product Per Category'
, FIRST_VALUE(p.Name) OVER(PARTITION BY p.ProductCategoryID ORDER BY p.Name) AS 'First Product Per Category'
, LAST_VALUE(p.Name) OVER(PARTITION BY p.ProductCategoryID ORDER BY p.Name) AS 'Last Product Per Category'
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
ORDER BY pc.Name, p.Name
























