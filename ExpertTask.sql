use Internship_DB

CREATE TABLE Managers (
    ManagerID INT IDENTITY(1,1) PRIMARY KEY,
    ManagerName NVARCHAR(50)
);

ALTER TABLE Departments ADD ManagerID INT;

INSERT INTO Managers (ManagerName)
VALUES 
    ('John Doe'),
    ('Sarah Smith'),
    ('Michael Johnson'),
    ('Emma Brown'),
    ('David Lee');

UPDATE Departments
SET ManagerID = 
    CASE 
        WHEN DepartmentName = 'HR' THEN 1
        WHEN DepartmentName = 'IT' THEN 2
        WHEN DepartmentName = 'Finance' THEN 3
        WHEN DepartmentName = 'Marketing' THEN 4
        WHEN DepartmentName = 'Operations' THEN 5
    END;

--- Task 1

-- Join Employees, Departments, and Managers to list employees with department and manager details.
SELECT 
    Employees.Name AS EmployeeName,
    Departments.DepartmentName,
    Managers.ManagerName
FROM 
    Employees
INNER JOIN 
    Departments ON Employees.DepartmentID = Departments.DepartmentID
INNER JOIN 
    Managers ON Departments.ManagerID = Managers.ManagerID;

-- Task 2

-- Rank employees by salary within their department using ROW_NUMBER().
SELECT 
    Name AS EmployeeName,
    DepartmentID,
    Salary,
    ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
FROM 
    Employees;

-- Rank employees across the company using RANK().
SELECT 
    Name AS EmployeeName,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS CompanyRank
FROM 
    Employees;

-- Task 3

-- Update employee salaries by 10%.
UPDATE Employees
SET Salary = Salary * 1.10;

-- Use transactions to commit or roll back updates
BEGIN TRANSACTION;

-- Increase salary by 10%
UPDATE Employees
SET Salary = Salary * 1.10;

-- Check if any salary exceeds a safe limit (e.g., $200,000)
IF EXISTS (
    SELECT 1 FROM Employees WHERE Salary > 200000
)
BEGIN
    -- If salary is too high, cancel the update
    ROLLBACK;
    PRINT 'Transaction rolled back because salary exceeded the limit.';
END
ELSE
BEGIN
    -- If everything is fine, commit changes
    COMMIT;
    PRINT 'Transaction committed successfully!';
END;
select * from Employees