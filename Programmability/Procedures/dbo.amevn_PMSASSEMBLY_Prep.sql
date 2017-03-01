SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[amevn_PMSASSEMBLY_Prep]
@WK int
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
	--,EventShift = CASE
 --     						   WHEN DATEPART(HOUR, Time_Build) >= 6 AND 
 --     								DATEPART(HOUR, Time_Build) < 14 THEN 1
 --     						   WHEN DATEPART(HOUR, Time_Build) >= 14 AND 
 --     								DATEPART(HOUR, Time_Build) < 22 THEN 2
 --     						   WHEN DATEPART(HOUR, Time_Build) >= 22 OR 
 --     								DATEPART(HOUR, Time_Build) < 6 THEN 3
 --     						   ELSE 0
 --     						   END,
	--EventDate= CONVERT(date,Time_Build),
	--EventHour= DATEPART(HOUR, Time_Build)
	
	 from FinalAssy.dbo.Build_Time bt WHERE
	--  bt.Time_Build >=CONVERT(date,getdate() )
	 datepart(wk,time_build)=       @WK
-- DATEPART(wk, getdate())
 AND DATEPART(yy,time_build)=DATEPART(yy,getdate())
	 )	
	 insert INTO 
	 -- select * from
	 PMSAssembly
	 select * FROM ctePMSAssembly
END
GO