CREATE TABLE [dbo].[DEPENDENT]
(
	[Essn] CHAR(9) NOT NULL PRIMARY KEY, 
    [Dependent_name] VARCHAR(15) NOT NULL, 
    [Sex] CHAR(9) NULL, 
    [Bdate] DATE NULL, 
    [Relationship] VARCHAR(8) NULL
)
