-- Create a sample table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Department NVARCHAR(50)
);

-- Insert sample data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Department)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'HR'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Finance'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 'Marketing'),
(5, 'Daniel', 'Brown', 'daniel.brown@example.com', 'Sales');

-- Create a clustered index on EmployeeID
CREATE CLUSTERED INDEX IX_EmployeeID
ON Employees (EmployeeID);

-- Create a non-clustered index on LastName
CREATE NONCLUSTERED INDEX IX_EmployeeLastName
ON Employees (LastName);

-- Create a non-clustered index on Email with included columns
CREATE NONCLUSTERED INDEX IX_EmployeeEmail
ON Employees (Email)
INCLUDE (FirstName, LastName)
WITH (FILLFACTOR = 80);

SELECT * FROM Employees
