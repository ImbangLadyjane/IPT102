INSERT DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date)

VALUES 
	('Darlene','10','2', '2002-08-30'),
	('Darlene1', '21', '4', '2003-08-30'),
	('Darlene2', '22', '6', '2004-08-30')GO

INSERT Department (Dname,Dnumber,Mgr_ssn,Mgr_start_date)
VALUES
	('CCIS', 001, 001, '1993-10-20'),
	('CTE', 002, 002, '1993-10-20'),
	('CBA', 003, 003, '1993-10-20'),
	('CAS', 004, 004, '1993-10-20'),
	('CSW', 005, 005, '1997-09-06')

SELECT * FROM Department

GO

DELETE FROM Department
WHERE Dnumber = 5;

GO

INSERT Department (Dname,Dnumber,Mgr_ssn,Mgr_start_date)
VALUES 	('CSW', 005, 005, '1997-09-06')

 