USE AdventureWorksDW2025;
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'FactResellerSales'
  AND COLUMN_NAME IN (
      'OrderDateKey',
      'ResellerKey',
      'ProductKey',
      'OrderQuantity',
      'UnitPrice',
      'ExtendedAmount',
      'DiscountAmount',
      'ProductStandardCost',
      'TotalProductCost',
      'SalesAmount',
      'SalesOrderNumber',
      'SalesOrderLineNumber'
  )
ORDER BY ORDINAL_POSITION;
GO