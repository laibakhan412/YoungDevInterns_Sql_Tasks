--task 1

--Create Internship_DB, tables Employees and Departments.
create database Internship_DB;

use Internship_DB;

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    Position NVARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(50),
    Location NVARCHAR(50)
);

--Insert 5 records into each table.

INSERT INTO Departments (DepartmentName, Location)
VALUES 
    ('HR', 'New York'),
    ('IT', 'San Francisco'),
    ('Finance', 'Chicago'),
    ('Marketing', 'Los Angeles'),
    ('Operations', 'Houston');

INSERT INTO Employees (Name, Position, Salary, DepartmentID)
VALUES 
    ('Alice Johnson', 'Manager', 60000, 1),
    ('Bob Smith', 'Analyst', 50000, 2),
    ('Carol Brown', 'Developer', 75000, 2),
    ('David Clark', 'Accountant', 55000, 3),
    ('Eva White', 'Executive', 65000, 4);

	select * from Employees;
	select * from Departments;

-- task 2

 -- Retrieve employees' names and positions
	select Name, Position from Employees;

 --List departments with locations.
	select DepartmentName, Location from Departments;

-- task 3

--Query employees earning > $50,000
	select Name, Position, Salary from Employees 
	where Salary > 50000;

--Sort employees by name.
	select Name, Position, Salary from Employees
	ORDER BY Name ASC;

--list departments in specific cities.
	select DepartmentName, Location from Departments
	where Location IN ('Chicago', 'New York');
