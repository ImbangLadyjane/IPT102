CREATE TABLE [dbo].[WORKS_ON]
(
	[Essn] CHAR(9) NOT NULL Constraint [PK_Works_SSN] Primary key,
    [Pno] INT NOT NULL Constraint [PK_Works_Number] Primary key,
    [Hours] DECIMAL(3, 1) NOT NULL

    Constraint [FK_Works_SSN] Foreign key (ESSN) References Employee(SSN),
    Constraint [FK_Works_Number] Foreign key (Pno) References Project(Pnumber),
);
GO

    create nonclustered index [IX_Works_Number] ON [Works_on] ([Pno] ASC)
