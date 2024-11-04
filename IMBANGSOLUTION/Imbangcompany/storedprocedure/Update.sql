CREATE PROCEDURE [dbo].[Update]
@Id INT,
@FirstName NVARCHAR(MAX),
@LastName NVARCHAR(MAX),
@Email NVARCHAR(MAX)

AS
Begin
update SubSystem
set
FirstName = @FirstName ,
LastName = @LastName ,
Email = @Email 
where Id =@Id

end
