SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		/*Author*/
-- Create date: /*Create Date*/
-- Description:	/*Description*/
--execute amevn_PDcreateHourlyReportDaily '06/21/2016', '06/22/2016'
--  execute amevn_PDcreateHourlyReportDaily '06/21/2016', '06/22/2016'
-- execute amevn_PDcreateHourlyReportDaily '06/19/2016 06:00:00', '06/20/2016 22:00:00'
-- =============================================
CREATE PROCEDURE /*procedure*/ [dbo].[amevn_PDcreateHourlyReportDaily]
@dateS datetime , @dateE datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--SET @dateS = CONVERT(date,getdate())
	--SET @dateE = DATEADD(d,1,CONVERT(date,getdate()))
    -- Insert statements for procedure here
	
	/*
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
	
	 from FinalAssy.dbo.Build_Time bt WHERE bt.Time_Build >=  @dateS AND bt.Time_Build <  @dateE)


	 select * INTO 
	 -- select * from
	 ##PMSRaw from ctePMSRaw
	 

	  -- do update shif3
	 UPDATE ##PMSRaw
	 SET EventDate= DATEADD(day,-1,EventDate) 
	 -- SELECT * from ##PMSRAW
	 where EventHour >=0 AND EventHour <=5
	 --SELECT * FROM ##PMSRaw p
	 --build clean data
	 IF OBJECT_ID('tempdb..##PMSCleanData') IS NOT NULL
      /*Then it exists*/ DROP TABLE ##PMSCleanData
	 ;WITH PMSCleanData AS (
	select Linename,eventshift, eventdate, eventhour, prodorder, sap_model, count(DISTINCT(acs_serial)) AS Cnt from ##PMSRaw p
	GROUP BY    Linename,eventshift, eventdate, eventhour, prodorder, sap_model
	 ) Select * INTO 
	 --  SELECT * from
	 ##PMSCleanData
	 from PMSCleanData
	  
	  select * from ##PMSCleanData ORDER BY ##PMSCleanData.eventdate, ##PMSCleanData.eventshift
	  */
	  SELECT *
  FROM [FinalAssy].[dbo].[vPMSLineReportEfficiency]
  WHERE Event_date >=  @dateS AND refStartdate <  @dateE

END
GO