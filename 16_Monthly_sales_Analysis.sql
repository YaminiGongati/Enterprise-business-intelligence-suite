USE AdventureWorksDW2025;
GO

SELECT
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonthNumber,
    DATENAME(MONTH, OrderDate) AS SalesMonth,
    COUNT(DISTINCT SalesOrderNumber) AS TotalOrders,
    SUM(SalesAmount) AS TotalSales,
    SUM(TotalProductCost) AS TotalProductCost,
    SUM(SalesAmount - TotalProductCost) AS ProductCostBasedProfit
FROM dbo.FactInternetSales
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate),
    DATENAME(MONTH, OrderDate)
ORDER BY
    SalesYear,
    SalesMonthNumber;
GO