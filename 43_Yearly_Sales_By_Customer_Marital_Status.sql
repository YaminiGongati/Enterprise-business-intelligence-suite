USE AdventureWorksDW2025;
GO

SELECT
    YEAR(s.OrderDate) AS SalesYear,
    c.MaritalStatus AS CustomerMaritalStatus,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    COUNT(DISTINCT s.CustomerKey) AS TotalCustomers,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimCustomer AS c
    ON s.CustomerKey = c.CustomerKey
GROUP BY
    YEAR(s.OrderDate),
    c.MaritalStatus
ORDER BY
    SalesYear,
    TotalSales DESC;
GO