CREATE TABLE [dbo].[DEPARTMENT]
(
	[Dname] VARCHAR(15) NOT NULL , 
    [Dnumber] INT NOT NULL, 
    [Mrg_ssn] CHAR(9) NOT NULL, 
    [Mrg_start_date] DATE NULL, 
    PRIMARY KEY ([Dnumber]), 
    CONSTRAINT [FK_DEPARTMENT_ToTable] FOREIGN KEY ([Column]) REFERENCES [ToTable]([ToTableColumn])
)
