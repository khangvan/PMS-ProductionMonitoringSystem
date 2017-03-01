SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckModelIsnotSetup]
	
AS
BEGIN


declare @currentdate   datetime

declare @TimeCurr datetime


select @currentdate =  convert(date, getdate())
--GETDATE() 
select @TimeCurr = datepart(hour,(GETDATE())) 


-- select * from PTR.dbo.CapacityControl

 
select * from FinalAssy.dbo.linename as L, FinalAssy.dbo.HourlyReport2 as H, PTR.dbo.CapacityControl as CC
where L.Line_Name = h.Line
and h.TargetPerHour >= '100'
and h.Date >= @currentdate 
--and h.Model not in 
--(
--select * from PTR.dbo.CapacityControl
--)


--and h.time = @TimeCurr


END


/*
use PTR
select * from PTR.dbo.CapacityControl
exec CheckModelIsnotSetup

*/
GO