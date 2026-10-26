USE AdventureWorksDW2025;
GO

SELECT TOP 10
    c.CustomerKey,
    c.FirstName,
    c.LastName,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimCustomer AS c
    ON s.CustomerKey = c.CustomerKey
GROUP BY
    c.CustomerKey,
    c.FirstName,
    c.LastName
ORDER BY
    TotalSales DESC;
GO