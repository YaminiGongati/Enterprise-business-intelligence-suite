USE AdventureWorksDW2025;
GO

SELECT
    COUNT(*) AS TotalSalesRows,
    COUNT(DISTINCT SalesOrderNumber) AS DistinctOrders,
    SUM(OrderQuantity) AS TotalQuantity,
    SUM(SalesAmount) AS TotalSales,
    SUM(TotalProductCost) AS TotalProductCost,
    SUM(SalesAmount - TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactResellerSales;
GO