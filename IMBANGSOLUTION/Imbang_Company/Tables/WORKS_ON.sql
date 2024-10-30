﻿CREATE TABLE [dbo].[WORKS_ON]
(
	[Essn]  CHAR(9)      NOT NULL,
	[Pno]   INT          NOT NULL,
	[Hours] DECIMAL(3,1) NOT NULL,
	CONSTRAINT [PK_WORKS_ON_ESSn, PK_Pno]PRIMARY KEY (Essn, Pno),
    CONSTRAINT [FK_WORKS_ON_Ssn]FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
    CONSTRAINT [FK_WORKS_ON_Pnumber]FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) 
);
GO

CREATE NONCLUSTERED INDEX[IX_WORKS_ON_Hours] On [WORKS_ON] ([Hours] ASC)