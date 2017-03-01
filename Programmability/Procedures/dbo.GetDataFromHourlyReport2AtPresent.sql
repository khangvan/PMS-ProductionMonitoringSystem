SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDataFromHourlyReport2AtPresent]
	-- Add the parameters for the stored procedure here
	@line nvarchar(20),
	@date DateTime,
	@time int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--    -- Insert statements for procedure here
--        IF (@line ='HH02FFC' )--or @line = 'HH02FFC'
-- (
--    	SELECT top 1 Line, PO, Model,Date, Time,TargetPerHour, Actual, Lost, Efficiency, Total_Actual, 0 Total_Lost,100 Total_Efficiency
--    FROM HourlyReport2 
--    WHERE Date = convert(date, getdate())
--    AND Time = datepart(hour,getdate())
--    AND Line IN ('HH02FFC')--, 'HH02FFC'
    
--);

--    IF (@line ='HH02' )--or @line = 'HH02FFC'
-- (
--    	SELECT top 1 Line, PO, Model,Date, Time,TargetPerHour, Actual, Lost, Efficiency, Total_Actual, 0 Total_Lost,100 Total_Efficiency
--    FROM HourlyReport2 
--    WHERE Date = convert(date, getdate())
--    AND Time = datepart(hour,getdate())
--    AND Line =@line
--);
    
--  else
--    (
	    SELECT top 1 Line, PO, Model,Date, Time,TargetPerHour, Actual, Lost, Efficiency, Total_Actual,  Total_Lost, Total_Efficiency
	   FROM HourlyReport2 
	   WHERE Date = @date
	   AND Time = @time
	   AND Line = @line
    --);

    ---- gốc
    ----	SELECT * 
    ----FROM HourlyReport2 
    ----WHERE Date = @date
    ----AND Time = @time
    ----AND Line = @line
--        IF (@line ='HH02FFC' )--or @line = 'HH02FFC'
-- (
--    	SELECT top 1 Line, PO, Model,Date, Time,TargetPerHour, Actual, Lost, Efficiency, Total_Actual, 0 Total_Lost,100 Total_Efficiency
--    FROM HourlyReport2 
--    WHERE Date = convert(date, getdate())
--   AND Time = datepart(hour,getdate())
--    AND Line IN ('HH02FFC')--, 'HH02FFC'
    
--);

--    IF (@line ='HH02' )--or @line = 'HH02FFC'
-- (
--    	SELECT top 1 Line, PO, Model,Date, Time,TargetPerHour, Actual, Lost, Efficiency, Total_Actual, 0 Total_Lost,100 Total_Efficiency
--    FROM HourlyReport2 
--    WHERE Date = convert(date, getdate())
--    AND Time = datepart(hour,getdate())
--    AND Line =@line
--);
   
END
GO