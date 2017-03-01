SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLastPOBase]
	-- Add the parameters for the stored procedure here
	@first DateTime,
	@second DateTime,
	@line nvarchar(10)
AS
BEGIN
	SELECT TOP 1 Time_Build,
    PO_Number, 
    Model, 
    Quantity , line
    FROM Build_Time 
    WHERE Time_Build BETWEEN @first AND @second AND 
    Line = @line
    ORDER BY Time_Build DESC
END
GO