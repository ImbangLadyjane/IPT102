GO

INSERT Employee (Fname, Minit, Lname, SSN, Bdate ,Address, Sex, Salary ,Super_ssn ,DNO)
Values
('Jane', 'D', 'Imbang', 001, '2003-07-30', 'Midsayap', 'F', 20, 001, 1),
('Darlene', 'S', 'Borines', 002, '2003-10-10', 'San-isidro', 'F', 10, 002, 1),
('Mary', 'G', 'Grace', 003, '2001-11-20', 'Palimbang', 'F', 30, 010, 1),
('Clark', 'M', 'zom', 004, '2002-08-24', 'Pikit', 'F', 100, 012, 1),
('Faith', 'S', 'Sandaga', 005, '2003-10-19', 'Bagumba', 'F', 200, 042, 2)

GO

Select * From Employee
ORDER by SSN ASC

GO

UPDATE Employee
SET Fname = 'Tom'
WHERE SSN = 001;

UPDATE Employee
SET Fname = 'Jerry'
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