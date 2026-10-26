USE AdventureWorksDW2025;
GO

SELECT TOP 10
    p.ProductKey,
    p.EnglishProductName AS ProductName,
    SUM(s.OrderQuantity) AS TotalQuantity,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimProduct AS p
    ON s.ProductKey = p.ProductKey
GROUP BY
    p.ProductKey,
    p.EnglishProductName
ORDER BY
    TotalSales DESC;
GO