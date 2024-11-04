CREATE PROCEDURE [dbo].[Read]

	@Search char (9)

AS
BEGIN

	SELECT
	*
	from [EMPLOYEE]
WHERE 
[Ssn] like @Search 

END