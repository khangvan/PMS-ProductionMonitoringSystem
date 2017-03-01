SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDataFromHourlyReportWhenHourLessThan6]
	-- Add the parameters for the stored procedure here
	@date date,
	@dateBefore date
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
	FROM HourlyReport
    WHERE (Date = @dateBefore AND Time >= '22') OR 
    (Date = @date AND Time < '6') 
    ORDER BY Date, Time, Model
END
GO