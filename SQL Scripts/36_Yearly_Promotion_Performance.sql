USE AdventureWorksDW2025;
GO

SELECT
    YEAR(s.OrderDate) AS SalesYear,
    pr.EnglishPromotionName AS PromotionName,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.DiscountAmount) AS TotalDiscount,
    SUM(s.TotalProductCost) AS TotalProductCost,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimPromotion AS pr
    ON s.PromotionKey = pr.PromotionKey
GROUP BY
    YEAR(s.OrderDate),
    pr.EnglishPromotionName
ORDER BY
    SalesYear,
    TotalSales DESC;
GO