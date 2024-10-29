CREATE TABLE [dbo].[DEPT_LOCATIONS]
(
	[Dnumber] INT NOT NULL Constraint [PK_Dept.Location_Locaton] Primary key,
    [Dlocation] VARCHAR(15) NOT NULL Constraint [FK_Dept.Location_Number] Foreign Key (Dnumber) References Department(Dnumber)
);
GO

	create  nonclustered index [IX_Dept.Location_Locstion] On [DEPT_LOCATIONS] ([Dlocation] ASC)
