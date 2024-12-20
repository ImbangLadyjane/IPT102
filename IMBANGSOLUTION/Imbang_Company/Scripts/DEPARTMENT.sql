﻿USE Imbang_Company_1
GO
DROP TABLE IF EXISTS dbo.DEPARTMENT;
GO

CREATE TABLE [dbo].[DEPARTMENT]
(
   [Dname]          VARCHAR(15) NOT NULL,
   [Dnumber]        INT         NOT NULL,
   [Mgr_ssn]        CHAR(9)     NOT NULL,
   [Mgr_start_date] DATE, 
   CONSTRAINT [PK_DEPARTMENT_Dnumber] PRIMARY KEY (Dnumber),
   CONSTRAINT [UX_DEPARTMENT_Dname] UNIQUE (Dname),
);
GO 

CREATE NONCLUSTERED INDEX [IX_DEPARTMENT_Name] ON [dbo].[DEPARTMENT] ([Dname] ASC)

INSERT INTO DEPARTMENT(Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES 
(N'Finance',11, N'123456789', '2002-08-30'),
(N'HR', 24, N'987654321', '2003-08-30'),
(N'IT', 26, N'897654321', '2004-08-30');
GO

SELECT * FROM DEPARTMENT;
GO

UPDATE dbo.DEPARTMENT
SET Dname ='Finace',
	Mgr_ssn ='143143143',
	Mgr_start_date = '2024-10-20'
WHERE Dnumber = 10;
GO

SELECT * FROM DEPARTMENT
ORDER by Dname ASC

GO

DELETE FROM dbo.DEPARTMENT
WHERE Dname = 'Finance';
GO

SELECT * FROM DEPARTMENT
GO

INSERT Department (Dname,Dnumber,Mgr_ssn,Mgr_start_date)
VALUES 	('SALES', 005, 005, '1997-09-06')
GO

SELECT * FROM DEPARTMENT
GO