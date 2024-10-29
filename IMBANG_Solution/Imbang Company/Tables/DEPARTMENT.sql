CREATE TABLE [dbo].[DEPARTMENT]
(
	[Dname] VARCHAR(15) NOT NULL , 
    [Dnumber] INT NOT NULL, 
    [Mrg_ssn] CHAR(9) NOT NULL, 
    [Mrg_start_date] DATE NULL, 
    
    Constraint [PK_Department_Number] Primary Key (Dnumber),
    Constraint [UX_Department_Name] UNIQUE nonclustered (Dnumber),
    Constraint [Fk_Department_Ssn] Foreign key (Mrg_ssn)References Employee (SSN)
);
GO

    create nonclustered index [Ix_Department_Name] On [DEPARTMENT] ([Dname]ASC) 
