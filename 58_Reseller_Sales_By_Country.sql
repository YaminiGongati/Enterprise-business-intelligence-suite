USE AdventureWorksDW2025;
GO

SELECT
    t.SalesTerritoryCountry AS Country,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactResellerSales AS s
INNER JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY
    t.SalesTerritoryCountry
ORDER BY
    TotalSales DESC;
GO