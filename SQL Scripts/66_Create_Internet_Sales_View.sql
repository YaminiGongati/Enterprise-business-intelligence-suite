USE AdventureWorksDW2025;
GO

CREATE OR ALTER VIEW dbo.vw_InternetSalesDetail
AS
SELECT
    s.SalesOrderNumber,
    s.SalesOrderLineNumber,
    s.OrderDate,
    d.CalendarYear AS SalesYear,
    d.MonthNumberOfYear AS SalesMonthNumber,
    d.EnglishMonthName AS SalesMonth,
    p.ProductKey,
    p.EnglishProductName AS ProductName,
    pc.EnglishProductCategoryName AS ProductCategory,
    psc.EnglishProductSubcategoryName AS ProductSubcategory,
    c.CustomerKey,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
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
INNER JOIN dbo.DimCustomer AS c
    ON s.CustomerKey = c.CustomerKey
INNER JOIN dbo.DimSalesTerritory AS t
    ON s.SalesTerritoryKey = t.SalesTerritoryKey;
GO

SELECT TOP (10) *
FROM dbo.vw_InternetSalesDetail;
GO