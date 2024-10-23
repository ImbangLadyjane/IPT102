GO

INSERT Employee (Fname, Minit, Lname, SSN, Bdate ,Address, Sex, Salary ,Super_ssn ,DNO)
Values
('Jane', 'S', 'Imbang', 001, '2003-09-29', 'San Isidro', 'M', 20, 001, 1),
('Lady', 'P', 'Samson', 002, '2012-01-10', 'Midsayap', 'F', 10, 002, 1),
('Darlene', 'S', 'Borines', 003, '2001-02-12', 'P1', 'M', 30, 010, 1),
('Belle', 'X', 'Lou', 004, '2003-11-09', 'Isda', 'P2', 100, 012, 1),
('Sky', 'X', 'Cruz', 005, '2013-12-15', 'Sea', 'P3', 200, 042, 2)

GO

Select * From Employee
ORDER by SSN ASC

GO

UPDATE Employee
SET Fname = 'Jane'
WHERE SSN = 001;

UPDATE Employee
SET Fname = 'Lady'
WHERE SSN = 001;

GO

DELETE FROM Employee
WHERE SSN = 005;

GO

SELECT Employee.*,Department.*
FROM Employee
RIGHT JOIN Department
ON Employee.SSN = Department.Mgr_ssn

GO

SELECT Employee.*,Department.Dnumber
FROM Employee
LEFT JOIN Department
ON Employee.SSN = Department.Mgr_ssn

GO 

SELECT Employee.*,Department.*
FROM Employee
RIGHT JOIN Department
ON Employee.SSN = Department.Mgr_ssn