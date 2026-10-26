USE AdventureWorksDW2025;
GO

SELECT COUNT(*) AS InvalidTerritoryReferences
FROM dbo.FactInternetSales AS s
LEFT JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey
WHERE t.SalesTerritoryKey IS NULL;
GO