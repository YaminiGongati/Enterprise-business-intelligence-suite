USE AdventureWorksDW2025;
GO

SELECT
    'Internet Sales - Source' AS Dataset,
    COUNT(*) AS TotalRows,
    SUM(SalesAmount) AS TotalSales
FROM dbo.FactInternetSales

UNION ALL

SELECT
    'Internet Sales - View',
    COUNT(*),
    SUM(SalesAmount)
FROM dbo.vw_InternetSalesDetail

UNION ALL

SELECT
    'Reseller Sales - Source',
    COUNT(*),
    SUM(SalesAmount)
FROM dbo.FactResellerSales

UNION ALL

SELECT
    'Reseller Sales - View',
    COUNT(*),
    SUM(SalesAmount)
FROM dbo.vw_ResellerSalesDetail;
GO