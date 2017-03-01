SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- amevn_PAtrack '2/1/2017', '2/22/2017' 
-- =============================================
CREATE PROCEDURE [dbo].[amevn_PAtrack]
@date datetime = '12/31/9999'
, @datee datetime = '12/31/9999'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @date = '12/31/9999'--> set current date
	set @date =convert(date, getdate());
	if @datee = '12/31/9999'--> set current date
	set @datee =dateadd(d,1,convert(date, getdate()));

	IF OBJECT_ID('tempdb..#tbRPT') IS NOT NULL
 TRUNCATE TABLE #tbRPT
  

	SELECT 
	 [OpID]
      ,[StationID]
	 ,[Model]
      , convert(date,[TimeUp]) EventDate
     , Datepart(hh,timeup) EventHour
      ,count(distinct(serial)) Cnt
      INTO #tbRPT
  FROM [FinalAssy].[dbo].[PAInfor]
  where timeup >= @date
  group by
   [OpID]
      ,[StationID]
	 ,[Model]
      , convert(date,[TimeUp]) 
     , Datepart(hh,timeup) 


	--SELECT * FROM #tbRPT

		;WITH  tbSumDay
	AS (select [OpID]
      ,[StationID]
	 ,[Model]
	 ,EventDate
	 ,EventHour
	 ,Cnt
	  from #tbRPT tsbsByShift)
	SELECT * FROM #tbRPT tsd
pivot (sum  (Cnt) for EventHour in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23])) as TotalPassPerDay

END
GO