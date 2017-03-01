SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_HourlyReportUpdate] 
    @ID int,
    @PO nchar(25) = NULL,
    @Model nchar(25) = NULL,
    @Line nchar(25) = NULL,
    @Station nchar(25) = NULL,
    @Target nchar(25) = NULL,
    @Actual nchar(25) = NULL,
    @Balance nchar(25) = NULL,
    @Efficiency nchar(25) = NULL,
    @Hour int = NULL,
    @BuildDateTime datetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[HourlyReport]
	SET    [PO] = @PO, [Model] = @Model, [Line] = @Line, [Station] = @Station, [Target] = @Target, [Actual] = @Actual, [Balance] = @Balance, [Efficiency] = @Efficiency, [Hour] = @Hour, [BuildDateTime] = @BuildDateTime
	WHERE  [ID] = @ID
	
	-- Begin Return Select <- do not remove
	SELECT [ID], [PO], [Model], [Line], [Station], [Target], [Actual], [Balance], [Efficiency], [Hour], [BuildDateTime]
	FROM   [dbo].[HourlyReport]
	WHERE  [ID] = @ID	
	-- End Return Select <- do not remove

	COMMIT
GO