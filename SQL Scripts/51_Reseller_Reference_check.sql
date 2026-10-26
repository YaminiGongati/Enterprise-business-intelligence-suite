USE AdventureWorksDW2025;
GO

SELECT
    COUNT(*) AS InvalidResellerReferences
FROM dbo.FactResellerSales AS s
LEFT JOIN dbo.DimReseller AS r
    ON s.ResellerKey = r.ResellerKey
WHERE r.ResellerKey IS NULL;
GO