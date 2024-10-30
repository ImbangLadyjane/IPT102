﻿CREATE TABLE [dbo].[PROJECT]
(
 [Pname]     VARCHAR(15) NOT NULL,
 [Pnumber]   INT         NOT NULL,
 [Plocation] VARCHAR(15),
 [Dnum]      INT         NOT NULL,
 CONSTRAINT [PK_PROJECT_Pnumber] PRIMARY KEY (Pnumber),
 CONSTRAINT [UI_PROJECT_Pname] UNIQUE      (Pname),
 CONSTRAINT [FK_PROJECT_Dnumber] FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
); 
GO

CREATE NONCLUSTERED INDEX[IX_PROJECT_Plocation] ON [PROJECT] ([Plocation] ASC) 