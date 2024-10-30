CREATE PROCEDURE [dbo].[Delete]
@Id INT
AS
Begin

delete from SubSystem where Id =@Id

end

