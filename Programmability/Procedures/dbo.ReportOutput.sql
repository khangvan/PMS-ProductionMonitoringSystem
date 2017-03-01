SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportOutput]

-- Add the parameters for the stored procedure here
@Daterpt datetime
AS
BEGIN

	SET NOCOUNT ON;


	--table0-- report top 5

	SELECT Line AS Line
	,      count(hr.Efficiency) AS CountHrsLowEff
	,      max(hr.Efficiency) AS MaxEff
	fROM dbo.HourlyReport2 hr
	WHERE hr.[Date] = @Daterpt AND hr.Efficiency < 90
	GROUP BY Date
	,        hr.Line
	ORDER BY .CountHrsLowEff DESC

	--table1- 

	SELECT convert(varchar(10), cast(hr.[Date] as date), 101) AS Ngày

	,      Line AS Line
	,      PO AS ProdOrder
	,      Model AS [SAP Model]
	
	,      Time AS Giờ
	,      Actual AS OutputHangGio
	,      TargetPerHour AS TargetGio60p
	,      DurationPerHour AS GioSuDung
	,      TargetPerDuration AS TargettrongGioSuDung
	,      Lost AS BalanceGio
	,      Efficiency AS HieuSuatGio
	,      '' AS Blank
	,      Total_Actual AS OutputCa
	,      Total_Lost AS BalanceCa
	,      Total_Efficiency AS HieuSuatCa

	fROM dbo.HourlyReport2 hr
	WHERE hr.[Date] = @Daterpt
	AND line IN
	(
	SELECT TOP 2 (Line) fROM 

	(
	SELECT TOP 10 Line AS Line
	,      count(hr.Efficiency) AS CountHrsLowEff
	,      max(hr.Efficiency) AS MaxEff
	fROM dbo.HourlyReport2 hr
	WHERE hr.[Date] = @Daterpt AND hr.Efficiency < 90
	GROUP BY Date
	,        hr.Line
	ORDER BY .CountHrsLowEff DESC	
	) AS y
	)
	ORDER BY .Line,
	.Ngày
	,        .Giờ
	   


	   --table 2-chọn line cho combo box
	   SELECT TOP 100 (Line) fROM 

	(
	SELECT TOP 100 Line AS Line
	,      count(hr.Efficiency) AS CountHrsLowEff
	,      max(hr.Efficiency) AS MaxEff
	fROM dbo.HourlyReport2 hr
	WHERE hr.[Date] = @Daterpt AND hr.Efficiency < 90
	GROUP BY Date
	,        hr.Line
	ORDER BY .CountHrsLowEff DESC	
	) AS y
	
	
	   

END
GO