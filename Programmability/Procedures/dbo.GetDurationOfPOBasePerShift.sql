SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDurationOfPOBasePerShift]
	-- Add the parameters for the stored procedure here
	@first DateTime,
	@second DateTime,
	@line nvarchar(10),
	@PO nvarchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		DATEDIFF(MINUTE, CONVERT(DATETIME,'00:00',108), CONVERT(VARCHAR, (GETDATE() - MIN(Time_Build)), 108)) AS Duration,
		MIN(Time_Build) AS First_Build, 
		GETDATE() AS CurrentTime 
    FROM Build_Time 
    WHERE 
		Time_Build BETWEEN @first AND @second AND 
		Line = @line AND 
		PO_Number = @PO
    GROUP BY PO_Number
END
GO