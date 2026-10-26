USE AdventureWorksDW2025;
GO

SELECT
    COUNT(*) AS TotalRows,
    SUM(SalesAmount) AS RecalculatedSales,
    SUM(TotalProductCost) AS RecalculatedProductCost,
    SUM(SalesAmount) - SUM(TotalProductCost)
        AS RecalculatedProductCostBasedProfit
FROM dbo.FactInternetSales;
GO