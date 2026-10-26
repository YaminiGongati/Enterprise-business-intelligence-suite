USE AdventureWorksDW2025;
GO

SELECT
    d.CalendarYear AS SalesYear,
    d.MonthNumberOfYear AS SalesMonthNumber,
    d.EnglishMonthName AS SalesMonth,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactResellerSales AS s
INNER JOIN dbo.DimDate AS d
    ON s.OrderDateKey = d.DateKey
GROUP BY
    d.CalendarYear,
    d.MonthNumberOfYear,
    d.EnglishMonthName
ORDER BY
    SalesYear,
    SalesMonthNumber;
GO