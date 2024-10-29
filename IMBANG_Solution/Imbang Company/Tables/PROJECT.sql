CREATE TABLE [dbo].[PROJECT]
(
	[Pname] VARCHAR(15) NOT NULL Constraint [UX_Project_Name] Unique nonclustered,
    [Pnumber] INT NOT NULL Constraint [PK_Project_Name] Primary key,
    [Plocation] VARCHAR(15) NULL, 
    [Dnum] INT NOT NULL Constraint [FK_Project_Number] Foreign key References Department,
    PRIMARY KEY ([Pnumber])
);
GO

    create nonclustered index [IX_Project_Location] ON[PROJECT] ([Plocation])
