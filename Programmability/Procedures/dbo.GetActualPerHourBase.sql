SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetActualPerHourBase]
	-- Add the parameters for the stored procedure here
	@first DateTime,
	@second DateTime,
	@line nvarchar(10),
	@PO nvarchar(15)
AS
BEGIN
	SELECT COUNT(DISTINCT(ACS_SERIAL)) AS Actual, 
    DATEPART(MINUTE, CONVERT(VARCHAR, (GETDATE() - MIN(Time_Build)), 108)) AS Duration 
    FROM Build_Time 
    WHERE 
		Time_Build BETWEEN @first AND @second AND 
		Line = @line AND 
		PO_Number = @PO
    GROUP BY Model
END
GO