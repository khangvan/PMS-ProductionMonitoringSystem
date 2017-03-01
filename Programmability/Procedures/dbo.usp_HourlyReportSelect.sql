SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- Batch submitted through debugger: SQLQuery7.sql|7|0|C:\Users\kvan\AppData\Local\Temp\~vs6C49.sql
CREATE PROC [dbo].[usp_HourlyReportSelect] 
    --@ID int
	@Station  nchar(20),
	@Start nchar(20),
	@End nchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [PO], [Model], [Line], [Station], [Target], [Actual], [Balance], [Efficiency], [Hour], [BuildDateTime] 
	FROM   [dbo].[HourlyReport] 
	WHERE  (Station = @Station)  
	and (BuildDateTime >= @Start and BuildDateTime <  @End) 

	COMMIT
GO