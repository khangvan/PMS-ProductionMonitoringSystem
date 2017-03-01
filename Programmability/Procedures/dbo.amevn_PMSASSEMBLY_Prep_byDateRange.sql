SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*

exec amevn_PMSASSEMBLY_Prep_byDateRange  '10/21/2016','10/22/2016'



*/

CREATE PROCEDURE [dbo].[amevn_PMSASSEMBLY_Prep_byDateRange]
@varStart datetime, @varEnd datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF OBJECT_ID('pmsassembly') IS NOT NULL
DELETE from pmsASSEMBLY
--select * from pmsASSEMBLY

--Get 
; WITH /*CTEname*/ctePMSAssembly as 
	 (
	 
	 select 
	--ROW_NUMBER()OVER(PARTITION BY po_number ORDER BY line,CONVERT(date,Time_Build)  )As RowNum,
	--bt.IDBuild as ID,
	bt.Line AS LineName,
	bt.PO_Number AS ProdOrder,  
	bt.model AS SAP_model,
	bt.ACS_Serial AS ACS_Serial,
	bt.Time_Build AS Last_event_date
	
	 from FinalAssy.dbo.Build_Time bt WHERE
	
-- datepart(wk,time_build)=      41-- @WK
--AND DATEPART(yy,time_build)=DATEPART(yy,getdate())

 -- date range change by kvan-oct 22
 -- date only without time
   bt.Time_Build >=@varStart and  bt.Time_Build<  DATEADD(dd,1, @varEnd)
	 )	
	 insert INTO 	 
	 -- select * from
	PMSAssembly
	 select * FROM ctePMSAssembly
END
GO