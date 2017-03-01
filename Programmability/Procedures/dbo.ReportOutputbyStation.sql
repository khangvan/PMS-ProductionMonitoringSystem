SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportOutputbyStation]

-- Add the parameters for the stored procedure here
@Daterpt datetime,
@LineRPT nchar(20)
AS
BEGIN

	SET NOCOUNT ON;

	

	SELECT 
	convert(varchar(10), cast(hr.[Date] as date), 101) AS Ngày

	,      Line AS Line
	,      PO AS ProdOrder
	,      Model AS [SAP Model]
	
	,      Time AS Giờ
	,      sum(Actual) AS SUMOutputHangGio--co
--	,      '' AS TargetGio60p
	,      sum(DurationPerHour) AS SUMGioSuDung--co
	--,      '' AS TargettrongGioSuDung
	--,      '' AS BalanceGio
	,      min(Efficiency) AS HieuSuatGio--co
	--,      '' AS Blank
	--,      Total_Actual AS OutputCa
	--,      Total_Lost AS BalanceCa
	--,      Total_Efficiency AS HieuSuatCa

	fROM dbo.HourlyReport2 hr
	WHERE hr.[Date] = @Daterpt
	AND line IN
	(
	@LineRPT
	)

	GROUP BY 
	convert(varchar(10), cast(hr.[Date] as date), 101) 

	,      Line 
	,      PO 
	,      Model 
	
	,      Time 
	ORDER BY .Line,
	.Ngày
	,        .Giờ
	   

---table 1

	SELECT 
	convert(varchar(10), cast(hr.[Date] as date), 101) AS Ngày

	,      Line AS Line
	,      PO AS ProdOrder
	,      Model AS [SAP Model]
	,      Time AS Giờ
	,      sum(Actual) AS SUMOutputHangGio--co
--	,      '' AS TargetGio60p
	,      sum(DurationPerHour) AS SUMGioSuDung--co
	--,      '' AS TargettrongGioSuDung
	--,      '' AS BalanceGio
	,      min(Efficiency) AS HieuSuatGio--co
	--,      '' AS Blank
	--,      Total_Actual AS OutputCa
	--,      Total_Lost AS BalanceCa
	--,      Total_Efficiency AS HieuSuatCa

	fROM dbo.HourlyReport2 hr
	WHERE hr.[Date] = @Daterpt
	AND line IN
	(
	@LineRPT
	)

	GROUP BY 
	convert(varchar(10), cast(hr.[Date] as date), 101) 

	,      Line 
	,      PO 
	,      Model 
	,      Time 
	ORDER BY .Line,
	.Ngày
	,        .Giờ

END
/*

exec ReportOutputbyStation '11/23/2015', 'hh02'
*/
GO