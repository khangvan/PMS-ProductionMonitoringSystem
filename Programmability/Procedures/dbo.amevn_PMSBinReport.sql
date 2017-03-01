SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[amevn_PMSBinReport]
AS
BEGIN
  -- routine body goes here, e.g.
  -- SELECT 'Navicat for SQL Server'
SELECT 
CONVERT(VARCHAR(10), Event_date, 103) AS Date_Event
,     Event_hour
,      Shift
,      Linename
,      sap_model
,      AssemblyQty
,    dbo.gobin(AssemblyQty) AS BINAssy
,    dbo.getbin(AssemblyQty,5,'min') AS BINAssyMin
,    dbo.getbin(AssemblyQty,5,'max') AS BINAssyMax

,    ( Target60Min)-- BINTarget
,      dbo.gobin(AvaiTime) BINAvai
--,      Efficiency
,dbo.gobin(Efficiency) AS BINEFF
,dbo.gobinwbar(Efficiency) AS Bar
,dbo.gobin(RefTotalMin) BinDuration
/*,      Lost
,      RefStartDate
,      RefEnddate

,      LoadDate
,      ChangeDate
,      ManPower
,      ManPowerAtCrHr
,      DateHourKey*/
FROM FinalAssy..vPMSLineReportEfficiency

END
GO