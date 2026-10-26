USE AdventureWorksDW2025;
GO

CREATE OR ALTER VIEW dbo.vw_CombinedSalesSummary
AS

SELECT
    'Internet' AS SalesChannel,
    d.CalendarYear AS SalesYear,
    d.MonthNumberOfYear AS SalesMonthNumber,
    d.EnglishMonthName AS SalesMonth,
    p.EnglishProductName AS ProductName,
    pc.EnglishProductCategoryName AS ProductCategory,
    t.SalesTerritoryRegion AS SalesTerritory,
    t.SalesTerritoryCountry AS Country,
    s.OrderQuantity,
    s.SalesAmount,
    s.TotalProductCost,
    s.SalesAmount - s.TotalProductCost
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimDate AS d
    ON s.OrderDateKey = d.DateKey
INNER JOIN dbo.DimProduct AS p
    ON s.ProductKey = p.ProductKey
LEFT JOIN dbo.DimProductSubcategory AS psc
    ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory AS pc
    ON psc.ProductCategoryKey = pc.ProductCategoryKey
INNER JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey

UNION ALL

SELECT
    'Reseller',
    d.CalendarYear,
    d.MonthNumberOfYear,
    d.EnglishMonthName,
    p.EnglishProductName,
    pc.EnglishProductCategoryName,
    t.SalesTerritoryRegion,
    t.SalesTerritoryCountry,
    s.OrderQuantity,
    s.SalesAmount,
    s.TotalProductCost,
    s.SalesAmount - s.TotalProductCost
FROM dbo.FactResellerSales AS s
INNER JOIN dbo.DimDate AS d
    ON s.OrderDateKey = d.DateKey
INNER JOIN dbo.DimProduct AS p
    ON s.ProductKey = p.ProductKey
LEFT JOIN dbo.DimProductSubcategory AS psc
    ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
LEFT JOIN dbo.DimProductCategory AS pc
    ON psc.ProductCategoryKey = pc.ProductCategoryKey
INNER JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey;
GO

SELECT
    SalesChannel,
    SUM(SalesAmount) AS TotalSales,
    SUM(TotalProductCost) AS TotalProductCost,
    SUM(ProductCostBasedProfit) AS ProductCostBasedProfit
FROM dbo.vw_CombinedSalesSummary
GROUP BY SalesChannel;
GO