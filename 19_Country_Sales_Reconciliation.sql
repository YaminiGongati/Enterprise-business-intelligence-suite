USE AdventureWorksDW2025;
GO

SELECT
    SUM(CountrySales) AS SumOfCountrySales
FROM
(
    SELECT
        g.EnglishCountryRegionName AS Country,
        SUM(s.SalesAmount) AS CountrySales
    FROM dbo.FactInternetSales AS s
    INNER JOIN dbo.DimSalesTerritory AS t
        ON s.SalesTerritoryKey = t.SalesTerritoryKey
    INNER JOIN dbo.DimGeography AS g
        ON t.SalesTerritoryKey = g.SalesTerritoryKey
    GROUP BY g.EnglishCountryRegionName
) AS CountrySummary;
GO

SELECT
    SUM(SalesAmount) AS TotalInternetSales
FROM dbo.FactInternetSales;
GO