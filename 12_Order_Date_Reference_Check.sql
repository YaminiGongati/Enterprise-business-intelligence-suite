USE AdventureWorksDW2025;
GO

SELECT COUNT(*) AS InvalidOrderDateReferences
FROM dbo.FactInternetSales AS s
LEFT JOIN dbo.DimDate AS d
    ON s.OrderDateKey = d.DateKey
WHERE d.DateKey IS NULL;
GO