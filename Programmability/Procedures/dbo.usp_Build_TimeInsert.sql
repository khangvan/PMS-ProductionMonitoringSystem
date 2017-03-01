SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_Build_TimeInsert] 
    @PO_Number nchar(12) = NULL,
    @ACS_Serial nchar(15) = NULL,
    @Time_Build datetime = NULL,
    @Model nchar(15) = NULL,
    @Line nchar(20) = NULL,
    @Quantity nchar(10) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Build_Time] ([PO_Number], [ACS_Serial], [Time_Build], [Model], [Line], [Quantity])
	SELECT @PO_Number, @ACS_Serial, @Time_Build, @Model, @Line, @Quantity
	
	-- Begin Return Select <- do not remove
	SELECT [IDBuild], [PO_Number], [ACS_Serial], [Time_Build], [Model], [Line], [Quantity]
	FROM   [dbo].[Build_Time]
	WHERE  [IDBuild] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO