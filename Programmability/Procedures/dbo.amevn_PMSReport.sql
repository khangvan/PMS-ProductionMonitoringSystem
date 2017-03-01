SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- amevn_PMSReport 'bylineall','', '07/14/2016'
-- =============================================
CREATE PROCEDURE [dbo].[amevn_PMSReport]
	@type nchar(30),@station nchar(30) = '',
	 @datetimeinput datetime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF (@type ='bylineall')
	BEGIN
	IF  EXISTS (
	SELECT TOP 1 * FROM dbo.vPMSLineReportEfficiency v
	WHERE v.refStartdate >= @datetimeinput
    ORDER BY linename, refStartdate )
    BEGIN
    SELECT * FROM dbo.vPMSLineReportEfficiency v
	WHERE v.refStartdate >= @datetimeinput
    ORDER BY linename, refStartdate
    END
    ELSE
    BEGIN
    SELECT 'Nodata' AS Result
    end

    END
    	IF (@type ='byline')
	BEGIN
	IF  EXISTS (
	SELECT TOP 1 * FROM dbo.vPMSLineReportEfficiency v
	WHERE v.refStartdate >= @datetimeinput
    ORDER BY linename, refStartdate )
    BEGIN
	SELECT * FROM dbo.vPMSLineReportEfficiency v
	WHERE v.refStartdate >= @datetimeinput
	AND linename=@station 
    ORDER BY linename, refStartdate 
    END
    ELSE
    BEGIN
    SELECT 'Nodata' AS Result
    end

    END

    IF (@type ='byorder')
	begin
	SELECT * FROM dbo.vpmsorderreport v
	WHERE v.refStartdate >= @datetimeinput
    ORDER BY linename, refStartdate desc
    end
END
GO