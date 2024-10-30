GO

INSERT Employee (Fname, Minit, Lname, SSN, Bdate ,Address, Sex, Salary ,Super_ssn ,DNO)
Values
('Steven', 'P', 'Molina', 001, '2003-09-29', 'Balay', 'M', 20, 001, 1),
('Manok', 'P', 'Chicken', 002, '2012-01-10', 'Balay1', 'F', 10, 002, 1),
('Balay', 'S', 'House', 003, '2001-02-12', 'House', 'M', 30, 010, 1),
('Suman', 'X', 'Biko', 004, '2003-11-09', 'Isda', 'M', 100, 012, 1),
('Screen', 'X', 'Mouse', 005, '2013-12-15', 'Sea', 'F', 200, 042, 2)

GO

Select * From Employee
ORDER by SSN ASC

GO

UPDATE Employee
SET Fname = 'Hotdog'
WHERE SSN = 001;

UPDATE Employee
SET Fname = 'Steven'
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