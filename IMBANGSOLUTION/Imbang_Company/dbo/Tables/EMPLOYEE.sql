CREATE TABLE [dbo].[EMPLOYEE]
(
    [Fname]     VARCHAR(15) NOT NULL, 
    [Minit]     CHAR,
    [Lname]     VARCHAR(15) NOT NULL,
    [Ssn]       CHAR(9)     NOT NULL,
    [Bdate]     Date,
    [Address]   VARCHAR(30),
    [Sex]       CHAR,
    [Salary]    DECIMAL(10,2),
    [Super_ssn] CHAR(9),
    [Dno]       INT         NOT NULL,
    CONSTRAINT [PK_EMPLOYEE_Ssn] PRIMARY KEY(Ssn)
)
GO

CREATE NONCLUSTERED INDEX [IX_EMPLOYEE_Name] ON [dbo].[EMPLOYEE]([Lname] ASC, [Fname] ASC);