SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

-- =============================================
CREATE PROCEDURE [dbo].[amevn_LineName_CheckInputMode]

	@Linenamei char(30) = Null
AS
BEGIN
DECLARE @mode char(10)
declare @Result char(10)
SET @mode = NULL
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select @mode=InputMode from dbo.LineName WHERE dbo.LineName.Line_Name=@linenamei
	IF @mode is NULL
	BEGIN
	SET @mode = 'NG'
	END



SET @Result = @mode
SELECT @Result AS Result	
											 
end
GO