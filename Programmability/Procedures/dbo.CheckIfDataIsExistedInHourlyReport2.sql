SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
/*
[CheckIfDataIsExistedInHourlyReport2]

*/

-- =============================================
CREATE PROCEDURE [dbo].[CheckIfDataIsExistedInHourlyReport2]
	-- Add the parameters for the stored procedure here
	@Date date ='02/06/2016',
	@Time int =16,
	
	@PO nvarchar(20)='100819323',	
	@model nvarchar(20)='740043800',
	@line nvarchar(20) ='HH02'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM HourlyReport2 
    WHERE Date = @Date AND 
    Time = @Time AND 
    PO = @PO AND 
    Model = @model AND 
    Line = @line
END
GO