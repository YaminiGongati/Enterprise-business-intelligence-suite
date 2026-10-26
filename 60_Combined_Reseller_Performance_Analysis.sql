USE AdventureWorksDW2025;
GO

-- 1. Reseller sales by territory
SELECT
    'Territory' AS AnalysisType,
    t.SalesTerritoryRegion AS AnalysisName,
    t.SalesTerritoryCountry AS Country,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactResellerSales AS s
INNER JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY
    t.SalesTerritoryRegion,
    t.SalesTerritoryCountry

UNION ALL

-- 2. Reseller sales by product category
SELECT
    'Category' AS AnalysisType,
    pc.EnglishProductCategoryName AS AnalysisName,
    NULL AS Country,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactResellerSales AS s
INNER JOIN dbo.DimProduct AS p
    ON s.ProductKey = p.ProductKey
INNER JOIN dbo.DimProductSubcategory AS psc
    ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
INNER JOIN dbo.DimProductCategory AS pc
    ON psc.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY
    pc.EnglishProductCategoryName;
GO