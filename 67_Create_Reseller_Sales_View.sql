USE AdventureWorksDW2025;
GO

CREATE OR ALTER VIEW dbo.vw_ResellerSalesDetail
AS
SELECT
    s.SalesOrderNumber,
    s.SalesOrderLineNumber,
    d.CalendarYear AS SalesYear,
    d.MonthNumberOfYear AS SalesMonthNumber,
    d.EnglishMonthName AS SalesMonth,
    p.ProductKey,
    p.EnglishProductName AS ProductName,
    pc.EnglishProductCategoryName AS ProductCategory,
    s.ResellerKey,
    t.SalesTerritoryRegion AS SalesTerritory,
    t.SalesTerritoryCountry AS Country,
    s.OrderQuantity,
    s.SalesAmount,
    s.TotalProductCost,
    s.SalesAmount - s.TotalProductCost
        AS ProductCostBasedProfit
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

SELECT TOP (10) *
FROM dbo.vw_ResellerSalesDetail;
GO

SELECT COUNT(*) AS ViewRows
FROM dbo.vw_ResellerSalesDetail;
GO