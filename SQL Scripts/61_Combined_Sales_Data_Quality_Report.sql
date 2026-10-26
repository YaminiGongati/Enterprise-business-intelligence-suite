USE AdventureWorksDW2025;
GO

SELECT
    'Internet Sales' AS Dataset,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN SalesOrderNumber IS NULL
        THEN 1 ELSE 0 END) AS MissingOrders,
    SUM(CASE WHEN ProductKey IS NULL
        THEN 1 ELSE 0 END) AS MissingProducts,
    SUM(CASE WHEN SalesAmount IS NULL
        THEN 1 ELSE 0 END) AS MissingSalesAmounts,
    SUM(CASE WHEN SalesAmount < 0
        THEN 1 ELSE 0 END) AS NegativeSalesRows
FROM dbo.FactInternetSales

UNION ALL

SELECT
    'Reseller Sales' AS Dataset,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN SalesOrderNumber IS NULL
        THEN 1 ELSE 0 END) AS MissingOrders,
    SUM(CASE WHEN ProductKey IS NULL
        THEN 1 ELSE 0 END) AS MissingProducts,
    SUM(CASE WHEN SalesAmount IS NULL
        THEN 1 ELSE 0 END) AS MissingSalesAmounts,
    SUM(CASE WHEN SalesAmount < 0
        THEN 1 ELSE 0 END) AS NegativeSalesRows
FROM dbo.FactResellerSales;
GO