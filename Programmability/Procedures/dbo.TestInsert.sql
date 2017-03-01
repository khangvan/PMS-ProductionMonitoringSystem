SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TestInsert]
	-- Add the parameters for the stored procedure here
@LastName nchar(10),
@FirstName nchar(10),
@LN nchar(10) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Test(LastName,FirstName) values (@LastName,@FirstName)
	SET @LN =(select LastName from Test where ID = (select max(ID) from Test))
END
GO