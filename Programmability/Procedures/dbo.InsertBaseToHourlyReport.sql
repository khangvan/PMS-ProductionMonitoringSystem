SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertBaseToHourlyReport]
(
	-- Add the parameters for the stored procedure here
	@model nvarchar(25),
	@target int,
	@line nvarchar(25),
	@actual int,
	@balance int,
	@efficiency int,
	@time int,
	@date Datetime
)
AS
BEGIN
	INSERT INTO [FinalAssy].[dbo].[HourlyReport] 
	([Model], [Target], [Line], [Actual], [Balance], [Efficiency], [Hour], [BuildDateTime])
	VALUES
     (@model, @target, @line, @actual, @balance, @efficiency, @time, @date)
END
GO