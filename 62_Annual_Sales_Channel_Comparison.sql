USE AdventureWorksDW2025;
GO

WITH AnnualSales AS
(
    SELECT
        d.CalendarYear AS SalesYear,
        'Internet Sales' AS SalesChannel,
        SUM(s.SalesAmount) AS TotalSales,
        SUM(s.TotalProductCost) AS TotalProductCost,
        SUM(s.SalesAmount - s.TotalProductCost)
            AS ProductCostBasedProfit
    FROM dbo.FactInternetSales AS s
    INNER JOIN dbo.DimDate AS d
        ON s.OrderDateKey = d.DateKey
    GROUP BY d.CalendarYear

    UNION ALL

    SELECT
        d.CalendarYear AS SalesYear,
        'Reseller Sales' AS SalesChannel,
        SUM(s.SalesAmount) AS TotalSales,
        SUM(s.TotalProductCost) AS TotalProductCost,
        SUM(s.SalesAmount - s.TotalProductCost)
            AS ProductCostBasedProfit
    FROM dbo.FactResellerSales AS s
    INNER JOIN dbo.DimDate AS d
        ON s.OrderDateKey = d.DateKey
    GROUP BY d.CalendarYear
)
SELECT
    SalesYear,
    SalesChannel,
    TotalSales,
    TotalProductCost,
    ProductCostBasedProfit
FROM AnnualSales
ORDER BY SalesYear, SalesChannel;
GO