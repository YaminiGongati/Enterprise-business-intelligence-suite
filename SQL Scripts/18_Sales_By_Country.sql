USE AdventureWorksDW2025;
GO

SELECT
    g.EnglishCountryRegionName AS Country,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost) AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey
INNER JOIN dbo.DimGeography AS g
    ON t.SalesTerritoryKey = g.SalesTerritoryKey
GROUP BY
    g.EnglishCountryRegionName
ORDER BY
    TotalSales DESC;
GO