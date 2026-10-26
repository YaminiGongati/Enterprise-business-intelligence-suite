USE AdventureWorksDW2025;
GO

-- Project 1: Enterprise Business Intelligence Suite
-- Phase 1: Identify business domain tables

SELECT
    TABLE_SCHEMA AS SchemaName,
    TABLE_NAME AS TableName
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
  AND (
       TABLE_NAME LIKE '%Sales%'
    OR TABLE_NAME LIKE '%Customer%'
    OR TABLE_NAME LIKE '%Product%'
    OR TABLE_NAME LIKE '%Date%'
    OR TABLE_NAME LIKE '%Geography%'
    OR TABLE_NAME LIKE '%Territory%'
    OR TABLE_NAME LIKE '%Employee%'
    OR TABLE_NAME LIKE '%Department%'
    OR TABLE_NAME LIKE '%Finance%'
    OR TABLE_NAME LIKE '%Inventory%'
    OR TABLE_NAME LIKE '%Currency%'
    OR TABLE_NAME LIKE '%Reseller%'
    OR TABLE_NAME LIKE '%Quota%'
  )
ORDER BY TABLE_NAME;
GO