SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertFFCToHourlyReport]
(
	-- Add the parameters for the stored procedure here
	@model nvarchar(25),	
	@line nvarchar(25),
	@station nvarchar(25),
	@actual int,
	@target int,
	@balance int,
	@efficiency int,
	@time int,
	@date Datetime
)
AS
BEGIN
	INSERT INTO [FinalAssy].[dbo].[HourlyReport] 
	([Model], [Target], [Line], [Station], [Actual], [Balance], [Efficiency], [Hour], [BuildDateTime])
	VALUES
     (@model, @target, @line, @station, @actual, @balance, @efficiency, @time, @date)
END
GO