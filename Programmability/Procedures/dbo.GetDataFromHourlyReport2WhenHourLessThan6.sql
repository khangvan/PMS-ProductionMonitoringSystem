SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDataFromHourlyReport2WhenHourLessThan6]
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
	,      right(PO,9) as ProdOrder
	,      Model as SAPModel
	, dbo.HourlyReport2.Man
	,      Actual as ACTHr
	,      Lost as LSTHr
	,      DurationPerHour as DUR
	,      TargetPerDuration as TGRDur
	,      TargetPerHour as TGR60
	,      Efficiency as EffHr
	,      Total_Actual as OUTPUTShift
	,      Total_Lost as LOSTinShift
	,      Total_Efficiency as EffShift

	FROM HourlyReport2 
    WHERE (Date = @dateBefore AND Time >= '22') OR 
    (Date = @date AND Time < '6') 
    ORDER BY Date, Time, PO, Model
END
GO