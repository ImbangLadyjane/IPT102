﻿/*
Deployment script for IMBANGDB1

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GOC:\IPT_IMBANG\IPT102\IMBANGSOLUTION\Imbang_Company\Storedprocedure\CREATE.sql
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "IMBANGDB1"
:setvar DefaultFilePrefix "IMBANGDB1"
:setvar DefaultDataPath "C:\Users\user\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\user\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating Procedure [dbo].[CREATE]...';


GO
CREATE PROCEDURE [dbo].[CREATE]
	@Dname nchar(10),
	@Dnumber nchar(10),
	@Mgr_ssn nchar(10),
	@Mgr_start_date DATE
	AS
BEGIN

SET NOCOUNT ON

	INSERT INTO [dbo].[DEPARTMENT]
				 ([Dnumber],[Dnumber],[Mgr_ssn],[Mgr_start_date])
		VALUES
				 (@Dnumber, @Dnumber, @Mgr_ssn, @Mgr_start_date);

END
GO
PRINT N'Creating Procedure [dbo].[DELETE]...';


GO
CREATE PROCEDURE [dbo].[DELETE]
	@Dnumber int
AS
BEGIN
	SET NOCOUNT ON;

	-- Delete the specified row
	DELETE FROM [dbo].[DEPARTMENT]
	WHERE [Dnumber] = @Dnumber;

	-- Reseed the identity if necessary
	DECLARE @DnumberValue int;
	SELECT @DnumberValue = ISNULL(MAX([Dnumber]), 0) FROM [dbo].[DEPARTMENT];
	DBCC CHECKIDENT ('DEPARTMENT', RESEED, @DnumberValue);

END
GO
PRINT N'Creating Procedure [dbo].[READ]...';


GO
CREATE PROCEDURE [dbo].[READ]
	AS
BEGIN

	SET NOCOUNT ON;

	SELECT [a].[Dnumber] AS DEPARTMENTDnumber
		,[a].[Dname] AS DEPARTMENTDname
		,[a].[Mgr_ssn] AS DEPARTMENTMgr_ssn
		,[a].[Mgr_start_date] AS DEPARTMENTMgr_start_date
	FROM [dbo].[DEPARTMENT] AS a;

END
GO
PRINT N'Creating Procedure [dbo].[SEARCH]...';


GO
CREATE PROCEDURE [dbo].[SEARCH]
	@Search nvarchar(50)

AS
BEGIN
	SET NOCOUNT ON;
	SET @Search = (CONCAT(COALESCE(@Search, N''),N'%'))
	SELECT 
		[a].[Dnumber]  AS Info1
	,[a].[Dname]AS Info2
	,[a].[Mgr_ssn] as Info3
	,[a].[Mgr_start_date] AS Info4
	FROM [dbo].[DEPARTMENT] AS a

	WHERE
	CONVERT (nvarchar(50),[Dnumber]) LIKE @Search OR
			[Dname] LIKE @Search OR
			[Mgr_ssn] LIKE @Search OR
			[Mgr_start_date] LIKE @Search 
		

				order by
			[Dname]
END
GO
PRINT N'Creating Procedure [dbo].[UPDATE]...';


GO
CREATE PROCEDURE [dbo].[UPDATE]
    @Dnumber INT,
    @Dname VARCHAR(15) NOT NULL,-- Changed to NVARCHAR for flexibility in department names
    @Mgr_ssn   CHAR(9)     NOT NULL,
    @Mgr_start_date DATE -- Changed to DATE to match the data type
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[DEPARTMENT]
    SET
        [Dname] = COALESCE(@Dname, [Dname]),
        [Mgr_ssn] = COALESCE(@Mgr_ssn, [Mgr_ssn]),
        [Mgr_start_date] = COALESCE(@Mgr_start_date, [Mgr_start_date])
    WHERE 
        [Dnumber] = @Dnumber;
END;
GO
PRINT N'Update complete.';


GO
