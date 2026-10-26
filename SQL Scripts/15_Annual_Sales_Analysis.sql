USE AdventureWorksDW2025;
GO

SELECT
    YEAR(OrderDate) AS SalesYear,
    COUNT(DISTINCT SalesOrderNumber) AS TotalOrders,
    SUM(OrderQuantity) AS TotalQuantity,
    SUM(SalesAmount) AS TotalSales,
    SUM(TotalProductCost) AS TotalProductCost,
    SUM(SalesAmount - TotalProductCost) AS ProductCostBasedProfit
FROM dbo.FactInternetSales
GROUP BY YEAR(OrderDate)
ORDER BY SalesYear;
GO