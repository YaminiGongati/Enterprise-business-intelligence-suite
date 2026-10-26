USE AdventureWorksDW2025;
GO

SELECT
    SUM(CountrySales) AS SumOfCountrySales
FROM
(
    SELECT
        t.SalesTerritoryCountry AS Country,
        SUM(s.SalesAmount) AS CountrySales
    FROM dbo.FactInternetSales AS s
    INNER JOIN dbo.DimSalesTerritory AS t
        ON s.SalesTerritoryKey = t.SalesTerritoryKey
    GROUP BY t.SalesTerritoryCountry
) AS CountrySummary;
GO

SELECT
    SUM(SalesAmount) AS TotalInternetSales
FROM dbo.FactInternetSales;
GO