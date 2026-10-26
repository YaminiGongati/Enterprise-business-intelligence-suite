USE AdventureWorksDW2025;
GO

SELECT
    c.EnglishEducation AS CustomerEducation,
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
    c.EnglishEducation
ORDER BY
    TotalSales DESC;
GO