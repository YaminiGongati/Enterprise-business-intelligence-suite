USE AdventureWorksDW2025;
GO

SELECT
    'Source Tables' AS CheckType,
    (SELECT COUNT(*) FROM dbo.FactInternetSales)
      + (SELECT COUNT(*) FROM dbo.FactResellerSales)
        AS TotalRows,
    (SELECT SUM(SalesAmount) FROM dbo.FactInternetSales)
      + (SELECT SUM(SalesAmount) FROM dbo.FactResellerSales)
        AS TotalSales

UNION ALL

SELECT
    'Combined View',
    COUNT(*),
    SUM(SalesAmount)
FROM dbo.vw_CombinedSalesSummary;
GO