SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateIntoHourlyReport2]
	-- Add the parameters for the stored procedure here
	
	@actual int,
	@lost int,
	@effi int,
	@totalActual int,
	@totalLost int,
	@totalEffi int,
	@targetPerHour int,
	@durationPerHour int,
	@targetPerDuration int,
	@date date,
	@time int,
	@PO nvarchar,
	@model nvarchar,
	@line nvarchar
	
AS
	declare @iPONumber nchar(30)
	declare @iSector nchar(15)
	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SET @iSector = 'None'
	SET @iPONumber =RIGHT('0000' + rtrim(ltrim(@PO)),9)			
		if exists(SELECT TOP 1 * FROM [DLVNDB].[dbo].[OpenPOPlanner] WHERE TopPONumber = @iPONumber	)
			begin
				SELECT TOP 1 @iSector = Sector FROM [DLVNDB].[dbo].[OpenPOPlanner] WHERE TopPONumber = @iPONumber
			end
    -- Insert statements for procedure here
    if (ltrim(rtrim(@iSector)) = 'HH01_Line')
		begin
			UPDATE HourlyReport2 
			SET 
			Actual = CEILING(@actual * 0.92), 
			Lost = CEILING(@lost * 1.08), 
			Efficiency = CEILING(@effi * 0.92), 
			Total_Actual = @totalActual, 
			Total_Lost = CEILING(@totalLost * 1.08), 
			Total_Efficiency = CEILING(@totalEffi * 0.92),                         
			TargetPerHour = @targetPerHour, 
			DurationPerHour = @durationPerHour, 
			TargetPerDuration = @targetPerDuration,
			Sector = @iSector
			WHERE 
			Date = @date AND 
			Time = @time AND 
			PO = @PO AND 
			Model = @model AND 
			Line = @line
			
		end
	else
		begin
			UPDATE HourlyReport2 
			SET 
			Actual = @actual, 
			Lost = @lost, 
			Efficiency = @effi, 
			Total_Actual = @totalActual, 
			Total_Lost = @totalLost, 
			Total_Efficiency = @totalEffi,                         
			TargetPerHour = @targetPerHour, 
			DurationPerHour = @durationPerHour, 
			TargetPerDuration = @targetPerDuration,
			Sector = @iSector
			WHERE 
			Date = @date AND 
			Time = @time AND 
			PO = @PO AND 
			Model = @model AND 
			Line = @line			
		end
END
GO