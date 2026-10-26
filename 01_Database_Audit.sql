/*
Project: Enterprise Business Intelligence Suite
Phase 1: Database Audit
Date: 23 October 2026
*/

USE AdventureWorksDW2025;
GO

-- Confirm database
SELECT DB_NAME() AS CurrentDatabase;
GO

-- List tables and approximate row counts
SELECT
    s.name AS SchemaName,
    t.name AS TableName,
    SUM(p.rows) AS ApproxRowCount
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
    ON t.schema_id = s.schema_id
LEFT JOIN sys.partitions AS p
    ON t.object_id = p.object_id
    AND p.index_id IN (0, 1)
GROUP BY
    s.name,
    t.name
ORDER BY
    s.name,
    t.name;
GO