SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[amevn_EFFGroupDataTopN]
AS
BEGIN
  -- routine body goes here, e.g.

IF OBJECT_ID('tempdb..##tmprptPMS') IS NOT NULL
/*Then it exists*/ DROP TABLE ##tmprptPMS
SELECT 
CONVERT(VARCHAR(10), Event_date, 103) AS Date_Event
,     Event_hour
,      Shift
,      Linename
,      sap_model
,      AssemblyQty
,    dbo.getbin(AssemblyQty,2,'full') AS BINAssy
,    dbo.getbin(AssemblyQty,2,'min') AS BINAssyMin
,    dbo.getbin(AssemblyQty,2,'max') AS BINAssyMax

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
into ##tmprptPMS
FROM FinalAssy..vPMSLineReportEfficiency
------------------------

SELECT * from ##tmprptPMS

END
GO