SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_HourlyReportInsert] 
    --@PO nchar(25) = NULL,
    
    @Line nchar(25) = NULL,
	@Model nchar(25) = NULL,
   -- @Station nchar(25) = NULL,
	 @Hour int = NULL,
    --@Target nchar(25) = NULL,
    @Actual nchar(25) = NULL,
    --@Balance nchar(25) = NULL,
    --@Efficiency nchar(25) = NULL,
   
    @BuildDateTime datetime = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[HourlyReport] 
	( [Model], [Line], [Actual],  [Hour], [BuildDateTime])
	SELECT  @Model, @Line,  @Actual, @Hour, @BuildDateTime
	
	-- Begin Return Select <- do not remove
	--SELECT [ID], [PO], [Model], [Line], [Station], [Target], [Actual], [Balance], [Efficiency], [Hour], [BuildDateTime]
	--FROM   [dbo].[HourlyReport]
	--WHERE  [ID] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
     
               
	COMMIT
GO