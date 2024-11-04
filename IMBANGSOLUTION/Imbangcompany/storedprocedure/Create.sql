CREATE PROCEDURE [dbo].[Create]
@FirstName NVARCHAR(MAX),
@LastName NVARCHAR(MAX),
@Email NVARCHAR(MAX)
AS
Begin
insert into SubSystem
(
FirstName,
LastName,
Email
)
values
(
@FirstName,
@LastName,
@Email
)


end

