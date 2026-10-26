USE AdventureWorksDW2025;
GO

WITH Quota AS
(
    SELECT
        EmployeeKey,
        CalendarYear AS SalesYear,
        SUM(SalesAmountQuota) AS SalesQuota
    FROM dbo.FactSalesQuota
    GROUP BY EmployeeKey, CalendarYear
),
ActualSales AS
(
    SELECT
        s.EmployeeKey,
        d.CalendarYear AS SalesYear,
        SUM(s.SalesAmount) AS ActualSales
    FROM dbo.FactResellerSales AS s
    INNER JOIN dbo.DimDate AS d
        ON s.OrderDateKey = d.DateKey
    GROUP BY
        s.EmployeeKey,
        d.CalendarYear
)
SELECT
    q.SalesYear,
    e.EmployeeKey,
    e.FirstName,
    e.LastName,
    q.SalesQuota,
    COALESCE(a.ActualSales, 0) AS ActualSales,
    COALESCE(a.ActualSales, 0) - q.SalesQuota
        AS QuotaVariance,
    CASE
        WHEN q.SalesQuota = 0 THEN NULL
        ELSE
            COALESCE(a.ActualSales, 0) * 100.0
            / q.SalesQuota
    END AS QuotaAchievementPct
FROM Quota AS q
INNER JOIN dbo.DimEmployee AS e
    ON q.EmployeeKey = e.EmployeeKey
LEFT JOIN ActualSales AS a
    ON q.EmployeeKey = a.EmployeeKey
    AND q.SalesYear = a.SalesYear
ORDER BY
    q.SalesYear,
    QuotaAchievementPct DESC;
GO