USE AdventureWorksDW2025;
GO

SELECT
    pr.EnglishPromotionName AS PromotionName,
    COUNT(DISTINCT s.SalesOrderNumber) AS TotalOrders,
    SUM(s.OrderQuantity) AS TotalQuantity,
    SUM(s.SalesAmount) AS TotalSales,
    SUM(s.DiscountAmount) AS TotalDiscount,
    SUM(s.SalesAmount - s.TotalProductCost)
        AS ProductCostBasedProfit
FROM dbo.FactInternetSales AS s
INNER JOIN dbo.DimPromotion AS pr
    ON s.PromotionKey = pr.PromotionKey
GROUP BY
    pr.EnglishPromotionName
ORDER BY
    TotalSales DESC;
GO