CREATE TABLE [dbo].[DEPENDENT]
(
	[Essn]           CHAR(9)     NOT NULL,
	[Dependent_name] VARCHAR(15) NOT NULL,
	[Sex]            CHAR,
	[Bdate]          DATE,
	[Relationship]   VARCHAR(8),
	CONSTRAINT [PK_Dependent_Essn, PK_Dependent_name] PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT [FK_Dependent_Ssn] FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) 
);	
GO

CREATE NONCLUSTERED INDEX[IX_DEPENDENT_name] ON [dbo].[DEPENDENT] ([Dependent_name] ASC)