SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_HourlyReportSelect4View] 
 
  --@ID int
	@Line  nchar(20),
	@Start nchar(20),
	@End nchar(20)
AS 
	SET NOCOUNT ON 
	--SET XACT_ABORT ON  


	SELECT [Hour], [Model], [Target], [Actual], [Balance], [Efficiency]
	FROM   [dbo].[HourlyReport] 
	WHERE  (Line = @Line)  
	and (BuildDateTime >= @Start and BuildDateTime <  @End) 

--RETURN 0 


GO