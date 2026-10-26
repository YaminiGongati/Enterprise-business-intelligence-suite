USE AdventureWorksDW2025;
GO

SELECT
    pc.EnglishProductCategoryName AS ProductCategory,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost) AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimProduct AS p
    ON s.ProductKey = p.ProductKey
INNER JOIN dbo.DimProductSubcategory AS ps
    ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
INNER JOIN dbo.DimProductCategory AS pc
    ON ps.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY
    pc.EnglishProductCategoryName
ORDER BY
    TotalSales DESC;
GO