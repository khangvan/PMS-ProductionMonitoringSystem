SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertIntoHourlyReport2]
	-- Add the parameters for the stored procedure here
	@date date,
	@time int,
	@PO Nvarchar,
	@model nvarchar,
	@actual int,
	@lost int,
	@effi int,
	@totalActual int,
	@totalLost int,
	@totalEffi int,
	@line nvarchar,
	@targetPerHour int,
	@durationPerHour int,
	@targetPerDuration int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO HourlyReport2 
    (Date, Time, PO, Model, Actual, Lost, Efficiency, Total_Actual, Total_Lost, Total_Efficiency, Line, TargetPerHour, DurationPerHour, TargetPerDuration) 
    VALUES 
    (
	@date,
	@time,
	@PO,
	@model,
	@actual,
	@lost,
	@effi,
	@totalActual,
	@totalLost, 
	@totalEffi,
	@line,
	@targetPerHour,
	@durationPerHour,
	@targetPerDuration
	)
END
GO