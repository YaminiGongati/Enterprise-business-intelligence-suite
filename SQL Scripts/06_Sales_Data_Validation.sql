USE AdventureWorksDW2025;
GO

-- Project 1: Sales data validation

SELECT
    COUNT(*) AS TotalSalesRows,
    COUNT(DISTINCT SalesOrderNumber) AS DistinctOrders,
    COUNT(DISTINCT CustomerKey) AS DistinctCustomers,
    SUM(OrderQuantity) AS TotalQuantity,
    SUM(SalesAmount) AS TotalSales,
    SUM(TotalProductCost) AS TotalProductCost,
    SUM(SalesAmount - TotalProductCost) AS ProductCostBasedProfit
FROM dbo.FactInternetSales;
GO