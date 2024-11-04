CREATE PROCEDURE [dbo].[Delete]
	@Ssn char(9)
AS
Begin

delete from [EMPLOYEE] where Ssn = @Ssn

END

