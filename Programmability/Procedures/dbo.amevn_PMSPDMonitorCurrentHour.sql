SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
---             exec  [amevn_PMSPDMonitorCurrentHour] 'HH02FFC'
-- =============================================
CREATE PROCEDURE [dbo].[amevn_PMSPDMonitorCurrentHour]
@Line varchar(30)
AS
BEGIN
	/****** Script for SelectTopNRows command from SSMS  ******/

--DECLARE @Line varchar(30)
DECLARE @dateselect datetime
DECLARE @fulldatetime datetime
DECLARE @Hourselect int
DECLARE @Shift int
DECLARE @startShift datetime
DECLARE @endShift datetime

set @dateselect = DATEADD(d,DATEDIFF(d,0,getdate()),0) --SELECT @dateselect AS servertime
SET @fulldatetime= GETDATE() --SELECT @fulldatetime AS fuldate
--getdate()
--SELECT @dateselect
--SET @line ='HH02FFC'

--- for start and end

SET @Hourselect= DATEPART(HOUR, GETDATE())
--SELECT @Hourselect

if (DATEPART(HOUR, getdate()) >= 6 AND	DATEPART(HOUR, getdate()) < 14 )
BEGIN
	SET @startShift = dateadd(hh,6, @dateselect)
	SET @endShift = dateadd(hh,14,@dateselect)
	--SELECT @startShift AS StartShit
	--SELECT @endShift
end

if( DATEPART(HOUR, getdate()) >= 14 AND	DATEPART(HOUR, getdate()) < 22 )
BEGIN


		SET @startShift = dateadd(hh,14,@dateselect)
	SET @endShift = dateadd(hh,22,@dateselect)
	--SELECT @startShift 
	--SELECT @endShift

END

 if (DATEPART(HOUR, @fulldatetime) >= 22 OR	DATEPART(HOUR, @fulldatetime) < 6 )
BEGIN
	SET @startShift = dateadd(hh,22, CONVERT(datetime,@dateselect))
	SET @endShift =dateadd(dd,1, dateadd(hh,06, @dateselect)) -- add time and +1 day next for shift3
	
	--SELECT @startShift 
	--SELECT @endShift
END 





--- end start&end






SELECT  TOP 1 -- in case 2 model order in one hour
[Date]= CONVERT(date,[Event_date])
,      [Event_hour] AS [Time]
,      '1000TEST' AS PO -- note for add
--,[Shift]
,      [Linename] AS Line
,      [sap_model] AS Model
,      [AssemblyQty] AS Actual
, Lost

,(
SELECT sum(AssemblyQty) -- bí kíp
FROM [vPMSLineReportEfficiency]
WHERE Linename=@Line	AND RefStartDate >= @startShift AND RefStartDate <@endShift
)AS TotalShiftActual
,      [Target60Min]
,      [AvaiTime]
,      [AvaiRate]
,      [Efficiency]
,      [RefStartDate]
,      [RefEnddate]
,      [RefTotalMin]
,      [LoadDate]
,      [ChangeDate]
,      [ManPower]
,      [ManPowerAtCrHr]
,      [DateHourKey]

FROM [FinalAssy].[dbo].[vPMSLineReportEfficiency]
WHERE
 Linename=@Line and
	 RefStartDate >= @startShift AND RefStartDate <@endShift
	--AND Event_hour = @Hourselect
ORDER BY refstartdate desc


/*
Date,   Time, PO, Model,
Actual, Lost, Efficiency, Total_Actual, Total_Lost, Total_Efficiency,
Line,
TargetPerHour, IDHourlyReport2, DurationPerHour, TargetPerDuration,
Man, Sector

*/

END
GO