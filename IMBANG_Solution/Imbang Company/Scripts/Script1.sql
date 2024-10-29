-- 1. Create the DEPARTMENT Table (if not exists)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DEPARTMENT' AND xtype='U')
BEGIN
    CREATE TABLE DEPARTMENT (
        DeptID INT IDENTITY(1,1) PRIMARY KEY,
        DeptName NVARCHAR(100) NOT NULL,
        Dnumber NVARCHAR(100) NOT NULL,  
        Mrg_start_date DATE NOT NULL
    );
    PRINT 'Table DEPARTMENT created successfully.';
END
GO

-- EMPLOYEE_NAME Table 
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='EMPLOYEE_NAME' AND xtype='U')
BEGIN
    CREATE TABLE EMPLOYEE_NAME (
        EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
        FirstName NVARCHAR(100) NOT NULL,
        LastName NVARCHAR(100) NOT NULL,
        Ssn INT FOREIGN KEY REFERENCES DEPARTMENT(DeptID),
        JobTitle NVARCHAR(100) NOT NULL,
        BDate DATE NOT NULL,
        Sex CHAR (9) NULL,
        Super_ssn CHAR(9) NULL,
        Dno INT NOT NULL 

    );
    PRINT 'Table EMPLOYEE_NAME created successfully.';
END
GO

-- 1.3 DEPENDENT 
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DEPENDENT' AND xtype='U')
BEGIN
    CREATE TABLE DEPENDENT (
        DependentID INT IDENTITY(1,1) PRIMARY KEY,
        EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE_NAME(EmployeeID),
        Sex CHAR (9) NULL,
        BDate DATE NOT NULL,
        DependentName NVARCHAR(100) NOT NULL,
        Relationship NVARCHAR(100) NOT NULL
    );
    PRINT 'Table DEPENDENT created successfully.';
END
GO

-- 4. Create the DEPT_LOCATIONS Table (if not exists)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DEPT_LOCATIONS' AND xtype='U')
BEGIN
    CREATE TABLE DEPT_LOCATIONS (
        LocationID INT IDENTITY(1,1) PRIMARY KEY,
        DNumber INT FOREIGN KEY REFERENCES DEPARTMENT(DeptID),
        DLocation NVARCHAR(100) NOT NULL
    );
    PRINT 'Table DEPT_LOCATIONS created successfully.';
END
GO

-- 5. Create the PROJECT Table (if not exists)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PROJECT' AND xtype='U')
BEGIN
    CREATE TABLE PROJECT (
        ProjectID INT IDENTITY(1,1) PRIMARY KEY,
        PName NVARCHAR(100) NOT NULL,
        DeptID INT FOREIGN KEY REFERENCES DEPARTMENT(DeptID),

         DATE NOT NULL
    );
    PRINT 'Table PROJECT created successfully.';
END
GO

-- 6. Create the WORKS_ON Table (if not exists)
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='WORKS_ON' AND xtype='U')
BEGIN
    CREATE TABLE WORKS_ON (
        EmployeeID INT FOREIGN KEY REFERENCES EMPLOYEE_NAME(EmployeeID),
        ProjectID INT FOREIGN KEY REFERENCES PROJECT(ProjectID),
        HoursWorked DECIMAL(5, 2) NOT NULL,
        PRIMARY KEY (EmployeeID, ProjectID)
    );
    PRINT 'Table WORKS_ON created successfully.';
END
GO

-- INSERT operations

-- 7. Insert Departments
INSERT INTO DEPARTMENT (DeptName, Manager)
VALUES ('IT', 'John Manager'), ('Finance', 'Jane Manager');
GO

-- 8. Insert Employees into the EMPLOYEE_NAME Table
INSERT INTO EMPLOYEE_NAME (FirstName, LastName, DeptID, JobTitle, HireDate)
VALUES 
('John', 'Doe', 1, 'Software Engineer', '2022-01-01'),
('Jane', 'Smith', 2, 'Financial Analyst', '2021-02-15');
GO

-- 9. Insert Dependents
INSERT INTO DEPENDENT (EmployeeID, DependentName, Relationship)
VALUES (1, 'Emily Doe', 'Daughter'), (2, 'Michael Smith', 'Son');
GO

-- 10. Insert Department Locations
INSERT INTO DEPT_LOCATIONS (DeptID, Location)
VALUES (1, 'New York'), (2, 'Los Angeles');
GO

-- 11. Insert Projects
INSERT INTO PROJECT (ProjectName, DeptID, StartDate)
VALUES ('Website Redesign', 1, '2023-06-01'), ('Financial Audit', 2, '2023-07-01');
GO

-- 12. Assign Employees to Projects (WORKS_ON Table)
INSERT INTO WORKS_ON (EmployeeID, ProjectID, HoursWorked)
VALUES (1, 1, 20.5), (2, 2, 35.0);
GO

-- UPDATE operations

-- 13. Update Employee Job Title
UPDATE EMPLOYEE_NAME
SET JobTitle = 'Senior Software Engineer'
WHERE EmployeeID = 1;
GO

-- 14. Update Project Hours in WORKS_ON Table
UPDATE WORKS_ON
SET HoursWorked = 30.0
WHERE EmployeeID = 1 AND ProjectID = 1;
GO

-- SELECT (Search) operations

-- 15. Search for Employees based on Department
SELECT e.FirstName, e.LastName, d.DeptName
FROM EMPLOYEE_NAME e
JOIN DEPARTMENT d ON e.DeptID = d.DeptID
WHERE d.DeptName = 'IT';
GO

-- 16. Search for Projects and Assigned Employees
SELECT p.ProjectName, e.FirstName, e.LastName, w.HoursWorked
FROM WORKS_ON w
JOIN PROJECT p ON w.ProjectID = p.ProjectID
JOIN EMPLOYEE_NAME e ON w.EmployeeID = e.EmployeeID
WHERE p.ProjectName = 'Website Redesign';
GO

-- DELETE operations

-- 17. Delete a Dependent
DELETE FROM DEPENDENT
WHERE DependentID = 1;
GO

-- 18. Remove an Employee from a Project (WORKS_ON Table)
DELETE FROM WORKS_ON
WHERE EmployeeID = 2 AND ProjectID = 2;
GO

-- 19. Delete an Employee
DELETE FROM EMPLOYEE_NAME
WHERE EmployeeID = 2;
GO

-- View All Employees and Projects After Deletions
SELECT * FROM EMPLOYEE_NAME;
SELECT * FROM WORKS_ON;
GO
