USE Imbang_Company1;
GO

DROP TABLE IF EXISTS dbo.DEPENDENT;
GO

CREATE TABLE dbo.DEPENDENT
(
	[Essn]           CHAR(9)     NOT NULL,
	[Dependent_name] VARCHAR(15) NOT NULL,
	[Sex]            CHAR,
	[Bdate]          DATE,
	[Relationship]   VARCHAR(8),
	CONSTRAINT [PK_Dependent_Essn] PRIMARY KEY (Essn, Dependent_name)
);
GO

CREATE NONCLUSTERED INDEX IX_DEPENDENT_name ON dbo.DEPENDENT ([Dependent_name] ASC);
GO

INSERT INTO dbo.DEPENDENT ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship])
VALUES
(N'123456789', N'Alice', N'F', N'2003-05-02', N'Child'),
(N'987654321', N'Hanah', N'F', N'1980-10-20', N'Spouse'),
(N'345675634', N'Jane', N'F', N'2003-02-20', N'Owner'); -- Corrected date
GO

SELECT * FROM dbo.DEPENDENT;
GO

DELETE FROM dbo.DEPENDENT WHERE Dependent_name = N'Jane';
GO

SELECT * FROM dbo.DEPENDENT;
GO
