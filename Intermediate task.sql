use Internship_DB;
--task 1.

--Use INNER JOIN to list employees and their departments.

select Employees.Name AS EmployeeName,Departments.DepartmentName from Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

--Use LEFT JOIN to list all employees, including those without departments.

select Employees.Name AS EmployeeName,Departments.DepartmentName from Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

--task 2.

--Calculate average salary.
SELECT AVG(Salary) AS AverageSalary from Employees;

--total employees per department.
SELECT Departments.DepartmentName,COUNT(Employees.EmployeeID) AS TotalEmployees
FROM Departments
LEFT JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName;

--highest salary in each department.
SELECT Departments.DepartmentName,MAX(Employees.Salary) AS HighestSalary
FROM Departments
LEFT JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY Departments.DepartmentName;

--task 3.

--Find employees earning more than the department's average salary.
SELECT Name AS EmployeeName,Salary FROM Employees
WHERE 
    Salary > (
        SELECT 
            AVG(Salary)
        FROM 
            Employees AS DeptAverage
        WHERE 
            DeptAverage.DepartmentID = Employees.DepartmentID
    );

--List departments with more than 3 employees.
SELECT DepartmentName FROM Departments
WHERE 
    DepartmentID IN (
        SELECT 
            DepartmentID
        FROM 
            Employees
        GROUP BY 
            DepartmentID
        HAVING 
            COUNT(EmployeeID) > 3
    );
