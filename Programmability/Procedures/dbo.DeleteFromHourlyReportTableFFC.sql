SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteFromHourlyReportTableFFC]
(
	@hr int,
	@time DateTime,
	@line nvarchar
)
AS
BEGIN
	DELETE 
    FROM [FinalAssy].[dbo].[HourlyReport]
    WHERE [Hour] = @hr
    AND
    [BuildDateTime] = @time
    AND
	[Line] = @line
	AND
    [Station] IS NOT NULL
END
GO