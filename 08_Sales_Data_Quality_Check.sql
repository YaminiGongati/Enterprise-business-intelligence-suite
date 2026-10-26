USE AdventureWorksDW2025;
GO

SELECT
    SUM(CASE WHEN SalesOrderNumber IS NULL THEN 1 ELSE 0 END)
        AS MissingOrderNumbers,
    SUM(CASE WHEN CustomerKey IS NULL THEN 1 ELSE 0 END)
        AS MissingCustomerKeys,
    SUM(CASE WHEN ProductKey IS NULL THEN 1 ELSE 0 END)
        AS MissingProductKeys,
    SUM(CASE WHEN SalesAmount IS NULL THEN 1 ELSE 0 END)
        AS MissingSalesAmounts,
    SUM(CASE WHEN TotalProductCost IS NULL THEN 1 ELSE 0 END)
        AS MissingProductCosts,
    SUM(CASE WHEN SalesAmount < 0 THEN 1 ELSE 0 END)
        AS NegativeSalesRows
FROM dbo.FactInternetSales;
GO