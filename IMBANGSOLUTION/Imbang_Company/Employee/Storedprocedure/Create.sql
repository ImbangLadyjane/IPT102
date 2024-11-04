CREATE PROCEDURE [dbo].[Create]

  @Fname     VARCHAR(15),
  @Minit     CHAR,
  @Lname     VARCHAR(15),
  @Ssn      CHAR(9),    
  @Bdate     Date,
  @Address   VARCHAR(30),
  @Sex       CHAR,
  @Salary    DECIMAL(10,2),
  @Super_ssn CHAR(9),
  @Dno       INT         
AS
Begin
insert into [EMPLOYEE] 
(Fname, Minit ,Lname, Ssn, Bdate, Address  ,Sex, Salary, Super_ssn, Dno )
values
(
 @Fname,
  @Minit,
  @Lname,
  @Ssn,    
  @Bdate,
  @Address,
  @Sex,
  @Salary,
  @Super_ssn,
  @Dno      
)


end

