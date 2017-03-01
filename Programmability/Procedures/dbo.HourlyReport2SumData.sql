SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[HourlyReport2SumData]
-- Add the parameters for the stored procedure here
  @date DATE
, @dateAfter DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Insert statements for procedure here
	SELECT DATE AS Ngay
	,      TIME AS Gio
	,      Line AS LineName
	,      RIGHT(PO, 9) AS ProdOrder
	,      Model AS SAPModel
	,      dbo.HourlyReport2.Man
	,      Actual AS ACTHr
	,      Lost AS LSTHr
	,      DurationPerHour AS DUR
	,      TargetPerDuration AS TGRDur
	,      TargetPerHour AS TGR60
	,      Efficiency AS EffHr
	,      Actual / TargetPerHour*100 AS EffHR2
	,      Total_Actual AS OUTPUTShift
	--,      Total_Lost AS LOSTinShift
	,      Total_Efficiency AS EffShift
	--,      IDHourlyReport2
	, capacityControl.ManPW
	FROM HourlyReport2, CapacityControl
	WHERE DATE = @date
		AND TIME >= '6'
		OR Date = @dateAfter
		AND Time < '6'
	ORDER BY Line
	,        DATE
	,        TIME
	,        PO
	,        Model;
END;
GO