SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[GetDataFromHourlyReport2WhenHourGreaterThan6]
-- Add the parameters for the stored procedure here
  @date date
, @dateAfter date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Insert statements for procedure here
	SELECT DATE AS Ngay
	,      TIME AS Gio
	,      hr.Line AS LineName
	,      RIGHT(PO, 9) AS ProdOrder
	,      Model AS SAPModel
	,      hr.man AS MAN
	,      ( CASE Actual WHEN 0    THEN 1
	                     WHEN NULL THEN 1
	                               ELSE Actual
	END ) AS ACTHrs
	,      Lost AS LSTHr
	,      DurationPerHour AS DUR
	,      TargetPerDuration AS TGRDur
	,      ( CASE TargetPerHour WHEN 0    THEN 1
	                            WHEN NULL THEN 1
	                                      ELSE TargetPerHour
	END ) AS OutREQu /*Ouput require per 60*/
	,      Efficiency AS EffHr /*It show speed per duration run*/
	--,cast(round((Actual / TargetPerHour*100 ),2)as decimal(5,2))as EffHR2
	
	,      Total_Actual AS OPTShift
	--,      Total_Lost AS LOSTinShift
	,      Total_Efficiency AS EffShift
	--,  (CASE
	--WHEN cc.TargetHrs IS NULL THEN 1000
	--when cc.TargetHrs = 0 then 1000
	--else cc.TargetHrs
	--END
	--) AS targetnow
	--,cast(round( (60/cast(cc.TargetHrs AS float)),2) as decimal(5,2)) as StandardTime
	--,cast(round( (60/cast(cc.TargetHrs AS float)*Actual),2) as decimal(5,2))  as OpTime
	FROM HourlyReport2 AS hr
	--, PTR.dbo.CapacityControl cc

	WHERE
		--cc.ProductGroup =Model and
		[DATE] = @date AND
		TIME >= '6' OR
		Date = @dateAfter AND
		Time < '6'
	ORDER BY hr.Line
	,        DATE
	,        TIME
	,        PO
	,        Model;
END;
GO