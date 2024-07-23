-- Create the original table
CREATE TABLE SalesData (
    SalesPerson NVARCHAR(50),
    Year INT,
    SalesAmount DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO SalesData (SalesPerson, Year, SalesAmount)
VALUES
('John Doe', 2021, 5000),
('John Doe', 2022, 6000),
('Jane Smith', 2021, 7000),
('Jane Smith', 2022, 8000);

-- Pivot the SalesData table
SELECT SalesPerson, [2021] AS Sales2021, [2022] AS Sales2022
INTO SalesDataPivoted
FROM (
    SELECT SalesPerson, Year, SalesAmount
    FROM SalesData
) AS SourceTable
PIVOT (
    SUM(SalesAmount)
    FOR Year IN ([2021], [2022])
) AS PivotTable;
SELECT * FROM SalesData

-- Unpivot the SalesDataPivoted table back to the original format
SELECT SalesPerson, Year, SalesAmount
FROM (
    SELECT SalesPerson, Sales2021, Sales2022
    FROM SalesDataPivoted
) AS PivotedTable   
UNPIVOT (
    SalesAmount FOR Year IN (Sales2021, Sales2022)
) AS UnpivotTable;
