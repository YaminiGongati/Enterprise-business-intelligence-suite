USE AdventureWorksDW2025;
GO

SELECT COUNT(*) AS InvalidCustomerReferences
FROM dbo.FactInternetSales AS s
LEFT JOIN dbo.DimCustomer AS c
    ON s.CustomerKey = c.CustomerKey
WHERE c.CustomerKey IS NULL;
GO