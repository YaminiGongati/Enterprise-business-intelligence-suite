USE AdventureWorksDW2025;
GO

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'FactResellerSales'
  AND (
      COLUMN_NAME LIKE '%Date%'
      OR COLUMN_NAME LIKE '%Reseller%'
      OR COLUMN_NAME LIKE '%Product%'
      OR COLUMN_NAME LIKE '%Sales%'
      OR COLUMN_NAME LIKE '%Cost%'
      OR COLUMN_NAME LIKE '%OrderQuantity%'
      OR COLUMN_NAME LIKE '%OrderNumber%'
      OR COLUMN_NAME LIKE '%Discount%'
      OR COLUMN_NAME LIKE '%Territory%'
  )
ORDER BY ORDINAL_POSITION;
GO