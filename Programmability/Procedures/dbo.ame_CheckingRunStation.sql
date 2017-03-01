SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_CheckingRunStation]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN


declare @currentdate   datetime

declare @TimeCurr datetime


select @currentdate =  convert(date, getdate())
--GETDATE() 
select @TimeCurr = datepart(hour,(GETDATE())) 


select l.Line_Name, l.LineGroup, h.*
from linename as L, 
HourlyReport2 as H
where L.Line_Name = h.Line
and h.Date = @currentdate 
----and h.time = @TimeCurr

select @currentdate as CurrentDate


END


/*
exec [ame_CheckingRunStation]
select * from HourlyReport2 where date >= '08/11/2015'

*/
GO