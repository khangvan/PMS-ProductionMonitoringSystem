SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_HourlyReportDelete] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[HourlyReport]
	WHERE  [ID] = @ID

	COMMIT
GO