USE Imbang_Company1;
GO


INSERT INTO EMPLOYEE(Fname, Minit, Lname, SSN, Bdate, Address, Sex, Salary, Super_ssn, DNO)
VALUES
('Jane', 'D', 'Imbang', 000000101, '2003-07-30', 'Midsayap', 'F', 20, NULL, 1),
('Darlene', 'S', 'Borines', 123456789, '2003-10-10', 'San-isidro', 'F', 10, 101, 2),
('Mary', 'G', 'Grace', 000000103, '2001-11-20', 'Palimbang', 'F', 30, 102, 3),
('Clark', 'M', 'Zom', 000000104, '2002-08-24', 'Pikit', 'F', 100, 103, 4),
('Faith', 'S', 'Sandaga', 000000105, '2003-10-19', 'Bagumba', 'F', 200, 104, 5);
GO

--View all employees ordered
SELECT * FROM Employee
ORDER BY SSN ASC;
GO

-- Update employee records
UPDATE Employee
SET Fname = 'Tom'
WHERE SSN = 000000101;  

SELECT * FROM Employee
ORDER BY SSN ASC;
GO

UPDATE Employee
SET Fname = 'Jane'
WHERE SSN = 000000101; 
GO

SELECT * FROM Employee
ORDER BY SSN ASC;
GO

DELETE FROM Employee
WHERE SSN = 105;  
GO

SELECT Employee.*, Department.*
FROM Employee
LEFT JOIN Department ON Employee.SSN = Department.Mgr_ssn;
GO

SELECT Employee.*, Department.*
FROM Employee
LEFT JOIN Department ON Employee.SSN = Department.Mgr_ssn;
GO

SELECT Employee.*, Department.*
FROM Employee
RIGHT JOIN Department ON Employee.SSN = Department.Mgr_ssn;
GO
