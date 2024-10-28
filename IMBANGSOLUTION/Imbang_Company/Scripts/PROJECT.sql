USE Imbang_Company_1;
GO

DROP TABLE IF EXISTS dbo.PROJECT;
GO

CREATE TABLE dbo.PROJECT
(
	[Pname]     VARCHAR(15) NOT NULL,
	[Pnumber]   INT         NOT NULL,
	[Plocation] VARCHAR(50),  -- Increased the length to avoid truncation
	[Dnum]      INT         NOT NULL,
	CONSTRAINT [PK_PROJECT_Pnumber] PRIMARY KEY (Pnumber),
	CONSTRAINT [UI_PROJECT_Pname] UNIQUE (Pname)
);
GO

CREATE NONCLUSTERED INDEX IX_PROJECT_Plocation ON dbo.PROJECT ([Plocation] ASC);
GO

INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES
(N'LEXA', 80, N'Midsayap North Cotabato', 22),
(N'NEXUS', 44, 'Cotabato', 23);
GO

SELECT * FROM dbo.PROJECT;
GO

UPDATE dbo.PROJECT
SET Plocation = 'NEW LOCATION',
	Dnum = 50
WHERE Pnumber = 80;
GO

SELECT * FROM dbo.PROJECT;
GO

-- LEFT JOIN BETWEEN DEPARTMENT & PROJECT
SELECT D.Dname AS Name, D.Dnumber AS Number, P.Pname, P.Plocation
FROM dbo.DEPARTMENT D
LEFT JOIN dbo.PROJECT P
ON D.Dnumber = P.Dnum;
GO
