
DROP TABLE IF EXISTS dbo.PROJECT;
GO

CREATE TABLE [dbo].[PROJECT]
(
    [Pname]     VARCHAR(15) NOT NULL,
    [Pnumber]   INT         NOT NULL,
    [Plocation] VARCHAR(15),
    [Dnum]      INT         NOT NULL,
    CONSTRAINT [PK_PROJECT_Pnumber] PRIMARY KEY (Pnumber),
    CONSTRAINT [UI_PROJECT_Pname] UNIQUE (Pname),
    CONSTRAINT [FK_PROJECT_Dnumber] FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
); 
GO

CREATE NONCLUSTERED INDEX[IX_PROJECT_Plocation] ON [PROJECT] ([Plocation] ASC) 

-- 2. Insert data into the PROJECT table
INSERT INTO PROJECT(Pname, Pnumber, Plocation, Dnum)
VALUES 
    (N'ProjectA', 1, N'New York', 101),
    (N'ProjectB', 2, N'Los Angeles', 102),
    (N'ProjectC', 3, N'Chicago', 103);
GO

-- Check if the data is inserted correctly by selecting all records from the PROJECT table
SELECT * FROM dbo.PROJECT;
GO

-- 3. Delete a project (e.g., delete ProjectB)
DELETE FROM dbo.PROJECT
WHERE Pnumber = 2;  
GO

-- 4. Search for a project by Pname (e.g., find ProjectA)
SELECT * FROM dbo.PROJECT
WHERE Pname = 'ProjectA';
GO

-- 5. Search for a project by Pnumber (e.g., find project with Pnumber = 1)
SELECT * FROM dbo.PROJECT
WHERE Pnumber = 1;
GO

-- (Optional) Update the location of a project (e.g., change ProjectC's location to 'Houston')
UPDATE dbo.PROJECT
SET Plocation = 'Houston'
WHERE Pnumber = 3;
GO

-- Check the update by selecting all records again
SELECT * FROM dbo.PROJECT;
GO
