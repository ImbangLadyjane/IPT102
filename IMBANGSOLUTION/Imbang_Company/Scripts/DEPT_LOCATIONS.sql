﻿USE Imbang_Company_1
GO

DROP TABLE IF EXISTS dbo.DEPT_LOCATIONS
GO

CREATE TABLE dbo.DEPT_LOCATIONS
(
	[Dnumber]   INT         NOT NULL,
	[Dlocation] VARCHAR(15) NOT NULL,
    CONSTRAINT [PK_DEPT_LOCATIONS_Dnumber, PK_Dlocation] PRIMARY KEY (Dnumber, Dlocation)
);
GO

CREATE NONCLUSTERED INDEX IX_DEPT_LOCATIONS ON dbo.DEPT_LOCATIONS ([Dnumber] ASC);
GO

INSERT  INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES
(10, 'Midsayap'),
(21, 'Gensan'),
(22, 'Davao');
GO

SELECT * FROM DEPT_LOCATIONS
GO

UPDATE dbo.DEPT_LOCATIONS
SET Dlocation = 'LOCATION1'
WHERE Dnumber = 10;
GO

SELECT * FROM DEPT_LOCATIONS;

DELETE FROM DEPT_LOCATIONS WHERE Dnumber = 10 and Dlocation = 'LOCATION1'
GO

SELECT * FROM DEPT_LOCATIONS;
GO

INSERT  INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES
(10, 'Midsayap');
GO