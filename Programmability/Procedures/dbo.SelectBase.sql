SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[SelectBase]
(
	@shift01Start Datetime,
	@shift03End Datetime
)
AS
BEGIN
	SELECT CONVERT(varchar(10), [Time_Build], 101) [Date], CONVERT(varchar(2), [Time_Build], 108) [Time], [Model], COUNT([Model]) AS Actual , [Line]
    FROM [FinalAssy].[dbo].[Build_Time] 
	WHERE Time_Build BETWEEN @shift01Start AND @shift03End
    GROUP BY CONVERT(varchar(10), [Time_Build], 101), CONVERT(varchar(2), [Time_Build], 108), [Model], [Line]
    ORDER BY [Date], [Time], [Model]
END
GO