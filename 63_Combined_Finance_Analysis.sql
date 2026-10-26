USE AdventureWorksDW2025;
GO

SELECT
    d.CalendarYear AS FinanceYear,
    sc.ScenarioName AS Scenario,
    a.AccountType,
    a.AccountDescription,
    dg.DepartmentGroupName AS Department,
    o.OrganizationName AS Organization,
    COUNT(*) AS FinanceRecords,
    SUM(f.Amount) AS TotalAmount
FROM dbo.FactFinance AS f
INNER JOIN dbo.DimDate AS d
    ON f.DateKey = d.DateKey
INNER JOIN dbo.DimScenario AS sc
    ON f.ScenarioKey = sc.ScenarioKey
INNER JOIN dbo.DimAccount AS a
    ON f.AccountKey = a.AccountKey
INNER JOIN dbo.DimDepartmentGroup AS dg
    ON f.DepartmentGroupKey = dg.DepartmentGroupKey
INNER JOIN dbo.DimOrganization AS o
    ON f.OrganizationKey = o.OrganizationKey
GROUP BY
    d.CalendarYear,
    sc.ScenarioName,
    a.AccountType,
    a.AccountDescription,
    dg.DepartmentGroupName,
    o.OrganizationName
ORDER BY
    FinanceYear,
    Scenario,
    TotalAmount DESC;
GO