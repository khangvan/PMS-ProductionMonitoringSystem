SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_Build_TimeDelete] 
    @IDBuild int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Build_Time]
	WHERE  [IDBuild] = @IDBuild

	COMMIT
GO