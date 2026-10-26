USE AdventureWorksDW2025;
GO

SELECT
    COUNT(*) AS InvalidProductReferences
FROM dbo.FactResellerSales AS s
LEFT JOIN dbo.DimProduct AS p
    ON s.ProductKey = p.ProductKey
WHERE p.ProductKey IS NULL;
GO