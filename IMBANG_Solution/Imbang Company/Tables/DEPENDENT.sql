CREATE TABLE [dbo].[DEPENDENT]
(
	[Essn] CHAR(9) NOT NULL PRIMARY KEY, 
    [Dependent_name] VARCHAR(15) NOT NULL, 
    [Sex] CHAR(9) NULL, 
    [Bdate] DATE NULL, 
    [Relationship] VARCHAR(8) NULL
    Constraint [PK_Dependent_Name] Primary key (Essn, Dependent_name),
    Constraint [FK_Dependent_Ssn] Foreign key (Essn) References Employee(Ssn)
);
GO
    create nonclustered Index [Ix_Dependent_Sex] ON [Dependent]([Sex] ASC)
