SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- ============================================= exec amevn_PMSLineReport 38
CREATE PROCEDURE [dbo].[amevn_PMSLineReport_byDateRange]
	-- Add the parameters for the stored procedure here
	@varStart datetime, @varEnd datetime
AS
BEGIN

	SET NOCOUNT ON;
SELECT 
Event_date
, Event_Hour ,
pr.Linename, sap_model
,count (pr.ACS_Serial) AS AssemblyQty  
, min(pr.Last_event_date) AS RefStartDate
, max(pr.Last_event_date) AS RefEnddate
	 , DATEDIFF(minute,min(pr.Last_event_date),max(pr.Last_event_date)) AS RefTotalMin
	 FROM 
	 --PMSRAW pr
	 --JOIN dbo.DimDate dd ON dd.DateKey =      Replace(CONVERT(varchar,last_event_date,102),'.','')
	 --JOIN dbo.DimTime dt ON dt.timekey =  Replace(CONVERT(VARCHAR,last_event_date,108),':','')

	 (
	 SELECT  *, convert(date, Last_event_date, 101) AS Event_date 
  , DATEPART(HOUR, Last_event_date) AS Event_hour
FROM PMSRAW
WHERE 
 last_event_date >=@varStart and  last_event_date<  DATEADD(dd,1, @varEnd)
--DATEPART(wk,last_event_date)=@WK--38
	 ) pr
	 
	 --WHERE DATEPART(wk,last_event_date)=38

	 GROUP BY Event_date, Event_Hour ,pr.Linename, sap_model
	 --ORDER BY  dd.fulldateUSA, dt.Hour30 ,pr.Linename, sap_model, min(pr.Last_event_date)


END
GO