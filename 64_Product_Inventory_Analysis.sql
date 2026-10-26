USE AdventureWorksDW2025;
GO

SELECT
    p.ProductKey,
    p.EnglishProductName AS ProductName,
    psc.EnglishProductSubcategoryName AS ProductSubcategory,
    SUM(i.UnitsIn) AS TotalUnitsIn,
    SUM(i.UnitsOut) AS TotalUnitsOut,
    SUM(i.UnitsIn - i.UnitsOut) AS NetUnitsMovement,
    COUNT(DISTINCT i.DateKey) AS InventoryDates
FROM dbo.FactProductInventory AS i
INNER JOIN dbo.DimProduct AS p
    ON i.ProductKey = p.ProductKey
LEFT JOIN dbo.DimProductSubcategory AS psc
    ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
GROUP BY
    p.ProductKey,
    p.EnglishProductName,
    psc.EnglishProductSubcategoryName
ORDER BY
    NetUnitsMovement DESC;
GO