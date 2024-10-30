CREATE PROCEDURE [dbo].[Read]

@Search NVARCHAR(MAX)
AS
Begin
select * from SubSystem where
FirstName Like @Search or
LastName Like @Search or
Email Like @Search 
end
