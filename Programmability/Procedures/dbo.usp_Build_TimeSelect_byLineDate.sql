SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_Build_TimeSelect_byLineDate] 
    @Line char(10),
	@Start datetime,
	@End datetime
	
	

AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

DECLARE @result nchar ( 20 ) 
	--BEGIN TRAN

	--SELECT [IDBuild], [PO_Number], [ACS_Serial], [Time_Build], [Model], [Line], [Quantity] 
	--FROM   [dbo].[Build_Time] 
	--WHERE  ([Time_Build] >= @Start and [Time_Build] <  @End) and line = @Line
	Set @Result = 'NG'
	
SELECT 
--PO_number AS PO , 
Line AS Line , 
model AS Model , 
datepart ( hour , ( time_build ) ) AS Hour , 
CONVERT(date, getdate()) as datetimebuild,
--CASE 
--    WHEN datepart ( hour , ( time_build ) ) BETWEEN 6 AND 13 THEN ' shift1 ' 
--    WHEN datepart ( hour , ( time_build ) ) BETWEEN 14 AND 21 THEN ' shift2 ' 
--    WHEN 
--    ( datepart ( hour , ( time_build ) ) BETWEEN 22 AND 23 ) OR 
--    ( datepart ( hour , ( time_build ) ) BETWEEN 0 AND 5 ) 
--    THEN ' shift3 ' 
--END 
--AS PDShift , 
count 
( 
    DISTINCT 
    ( 
        acs_serial 
    ) 
) 
AS ACT 
FROM build_time 
WHERE ([Time_Build] >= @Start and [Time_Build] <  @End) and line = @Line
--Line LIKE 'HH02%' 
--AND time_build BETWEEN '2015-06-17 ' AND '2015-06-18' 
GROUP BY 
--PO_number , 
model , 
Line , 

datepart ( hour , ( time_build ) ) 
ORDER BY datepart ( hour , ( time_build ) ) 

SET @result = 'OK' 
SELECT @result AS Result 

--return @Result

GO