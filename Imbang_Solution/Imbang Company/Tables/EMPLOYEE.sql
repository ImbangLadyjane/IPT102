﻿CREATE TABLE [dbo].[EMPLOYEE]
(
	[Fname] VARCHAR(15) NOT NULL , 
    [Minit] CHAR(9) NULL, 
    [Lname] VARCHAR(15) NOT NULL, 
    [Ssn] CHAR(9) NOT NULL, 
    [Bdate] DATE NULL, 
    [Address] VARCHAR(30) NULL, 
    [Sex ] CHAR(9) NULL, 
    [Salary] DECIMAL(10, 2) NULL, 
    [Super_ssn] CHAR(9) NULL, 
    [Dno] INT NOT NULL, 
    PRIMARY KEY ([Ssn])
)