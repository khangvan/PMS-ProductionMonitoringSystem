SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

--amevn_getStartEndTime '10/02/2016','','' output,''
-- =============================================
CREATE PROCEDURE [dbo].[amevn_getStartEndTime] 
	-- Add the parameters for the stored procedure here
	@DateTime datetime ,
	@WK int output,
	@S datetime output,
	@E datetime Output
AS
BEGIN
	
DECLARE @d DATETIME

SET @d = @DateTime


  --@d,
select @S= DATEADD(dd, 0-(@@DATEFIRST + 5 + DATEPART(dw, @d)) % 7, @d) 
 select @E= DATEADD(dd, 6 - (@@DATEFIRST + 5 + DATEPART(dw, @d)) % 7, @d) 
  select @Wk= datepart(isowk,@d)

  --SELECT @S
  --SELECT @E
  --SELECT @WK	 
END
GO