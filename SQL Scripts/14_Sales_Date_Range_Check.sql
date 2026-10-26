USE AdventureWorksDW2025;
GO

SELECT
    MIN(OrderDate) AS FirstOrderDate,
    MAX(OrderDate) AS LastOrderDate,
    COUNT(DISTINCT YEAR(OrderDate)) AS NumberOfSalesYears
FROM dbo.FactInternetSales;
GO