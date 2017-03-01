SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDataFromHourlyReportWhenHourGreaterThan6]
	-- Add the parameters for the stored procedure here
	@date date,
	@dateAfter date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DATE as Ngay
	,      TIME as Gio
	,      Line as LineName
	,      Model as SAPModel
	,      Actual as ACTHr

	--,      IDHourlyReport2


	FROM HourlyReport
	WHERE (
		DATE = @date
		AND TIME >= '6'
		) OR
		(
		Date = @dateAfter AND Time < '6'
		)
	ORDER BY Line
	,        DATE
	,        TIME

	,        Model
END
GO