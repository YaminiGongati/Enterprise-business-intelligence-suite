USE AdventureWorksDW2025;
GO

SELECT
    COALESCE(p.Color, 'Not Specified') AS ProductColor,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimProduct AS p
    ON s.ProductKey = p.ProductKey
GROUP BY
    COALESCE(p.Color, 'Not Specified')
ORDER BY
    TotalSales DESC;
GO