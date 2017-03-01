SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- Server : vnmacsdb.dl.net -- 

--USE [ACSEEState] 
--GO 




-- =============================================
-- Author:		/*Author*/
-- Create date: /*Create Date*/
-- Description:	/*Description
/*
  exec amevn_byDateRange '10/15/2016', '10/22/2016'
*/
-- =============================================
CREATE PROCEDURE [dbo].[amevn_byDateRange]
--@varStart datetime = NULL, @varEnd datetime= NULL
	
AS
BEGIN
	
	SET NOCOUNT ON;


	--   BEGIN--temp run
 --   SELECT 
 --    CONVERT(date,'10/15/2016') AS varStart 
	--,CONVERT(date,'10/16/2016') AS varEnd
	--, datepart(isowk,getdate())  as varWKISO
	--return
 --   end--temp run
    ----

	BEGIN 
	
	DECLARE @BlockDay int
	set @blockday =-2 -- set run block here
    
 SET DATEFIRST 1     /* or use any other weird value to test it */
DECLARE @d DATETIME


  SEt @d =GETDATE()
 --SEt @d ='12/26/2016'
      
      select 
	 CONVERT(date,DATEADD(dd,@blockday,@d/*getdate()*/)) AS varStart 
	 --,CONVERT(date,DATEADD(dd, 0-(@@DATEFIRST + 5 + DATEPART(dw, @d)) % 7, @d)) AS varStart 
       ,  CONVERT(date,DATEADD(dd, 6 - (@@DATEFIRST + 5 + DATEPART(dw, @d)) % 7, @d))  AS varEnd
       , datepart(isowk,@d)  as varWKISO

    END

 
 

END
GO