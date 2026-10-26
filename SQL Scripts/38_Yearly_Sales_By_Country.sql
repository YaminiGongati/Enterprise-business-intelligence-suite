USE AdventureWorksDW2025;
GO

SELECT
    YEAR(s.OrderDate) AS SalesYear,
    t.SalesTerritoryCountry AS Country,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY
    YEAR(s.OrderDate),
    t.SalesTerritoryCountry
ORDER BY
    SalesYear,
    TotalSales DESC;
GO