SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[amevn_EFFGroupData]
AS
BEGIN
  -- routine body goes here, e.g.
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
FROM FinalAssy..vPMSLineReportEfficiency
END
GO