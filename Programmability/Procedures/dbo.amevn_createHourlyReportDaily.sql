SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		/*Author*/
-- Create date: /*Create Date*/
-- Description:	/*Description*/
-- =============================================
CREATE PROCEDURE /*procedure*/ [dbo].[amevn_createHourlyReportDaily]

AS
BEGIN

	SET NOCOUNT ON;


IF OBJECT_ID('tempdb..##PMSRaw') IS NOT NULL
/*Then it exists*/ DROP TABLE ##PMSRaw
	; WITH /*CTEname*/ctePMSRaw as 
	 (
	 
	 select 
	ROW_NUMBER()OVER(PARTITION BY po_number ORDER BY line,CONVERT(date,Time_Build)  )As RowNum,
	bt.IDBuild as ID,
	bt.Line AS Linename,
	bt.PO_Number AS ProdOrder,  
	bt.model AS SAP_model,
	bt.ACS_Serial AS ACS_Serial,
	bt.Time_Build AS Last_event_date,
	EventShift = CASE
      						   WHEN DATEPART(HOUR, Time_Build) >= 6 AND 
      								DATEPART(HOUR, Time_Build) < 14 THEN 1
      						   WHEN DATEPART(HOUR, Time_Build) >= 14 AND 
      								DATEPART(HOUR, Time_Build) < 22 THEN 2
      						   WHEN DATEPART(HOUR, Time_Build) >= 22 OR 
      								DATEPART(HOUR, Time_Build) < 6 THEN 3
      						   ELSE 0
      						   END,
	EventDate= CONVERT(date,Time_Build),
	EventHour= DATEPART(HOUR, Time_Build)
	
	 from FinalAssy.dbo.Build_Time bt WHERE
	--  bt.Time_Build >=CONVERT(date,getdate() )
	 datepart(m,time_build)=        DATEPART(mm, getdate())
	    
	

	 )
	 select * INTO 
	 -- select * from
	 ##PMSRaw from ctePMSRaw
	 

	  -- do update shif3
	 UPDATE ##PMSRaw
	 SET EventDate= DATEADD(day,-1,EventDate) 
	 -- SELECT * from ##PMSRAW
	 where EventHour >=0 AND EventHour <=5
	
	
	-- SELECT * FROM ##PMSRaw p
	 
	 ---****************************************************************************************************
	 --build clean data
	 IF OBJECT_ID('tempdb..##PMSCleanData') IS NOT NULL
      /*Then it exists*/ DROP TABLE ##PMSCleanData
	 ;WITH PMSCleanData AS (
	select Linename,eventshift, eventdate, eventhour, prodorder, sap_model, count(DISTINCT(acs_serial)) AS Cnt from ##PMSRaw p
	GROUP BY    Linename,eventshift, eventdate, eventhour, prodorder, sap_model
	 ) Select * INTO 
	 --  select * from 
	 ##PMSCleanData
	 from PMSCleanData


	 	 ---****************************************************************************************************
		 IF OBJECT_ID('tempdb..##tbSumHourly') IS NOT NULL
           /*Then it exists*/ DROP TABLE ##tbSumHourly
	 ---view  getdaily report ouput
;WITH tbSumHourly
AS
(
	select eventdate
	--,      eventshift
	,      prodorder
	,      sap_model sap_model
	,      linename
	,      eventhour
	,      Cnt
	from ##PMSCleanData tsbsByShift
)
SELECT * INTO ##tbSumHourly
FROM tbSumHourly tsd
pivot (sum (Cnt) for Eventhour in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23])) as TotalPassPerDay

ORDER BY linename
,        eventdate
--,        eventshift
,        prodorder
,        sap_model

	SELECT * FROM ##tbSumHourly tsh

 ---****************************************************************************************************
 IF OBJECT_ID('tempdb..##tbSumShift') IS NOT NULL
 /*Then it exists*/ DROP TABLE ##tbSumShift

;WITH tbSumShift
AS
(
	select eventdate
	,      eventshift
	,      prodorder
	,      sap_model 
	,      linename
	,      Cnt
	from ##PMSCleanData 
)
SELECT  * INTO ##tbSumShift
FROM tbSumShift tss 
pivot (sum (tss.Cnt) for tss.eventshift in ([1],[2],[3])) as TotalOutPerShift
ORDER BY linename
,        eventdate
,        prodorder
,        sap_model

select * from ##tbSumShift tss

--never delete    [amevn_createHourlyReportDaily]
END


GO