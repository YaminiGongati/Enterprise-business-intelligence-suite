USE AdventureWorksDW2025;
GO

SELECT
    CASE
        WHEN YearlyIncome < 25000 THEN 'Below 25K'
        WHEN YearlyIncome < 50000 THEN '25K-49K'
        WHEN YearlyIncome < 75000 THEN '50K-74K'
        WHEN YearlyIncome < 100000 THEN '75K-99K'
        ELSE '100K and Above'
    END AS CustomerIncomeGroup,
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
    CASE
        WHEN YearlyIncome < 25000 THEN 'Below 25K'
        WHEN YearlyIncome < 50000 THEN '25K-49K'
        WHEN YearlyIncome < 75000 THEN '50K-74K'
        WHEN YearlyIncome < 100000 THEN '75K-99K'
        ELSE '100K and Above'
    END
ORDER BY
    TotalSales DESC;
GO