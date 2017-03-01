CREATE TABLE [dbo].[Build_Time] (
  [PO_Number] [nchar](12) NULL,
  [ACS_Serial] [nchar](15) NULL,
  [Time_Build] [datetime] NULL,
  [Model] [nchar](30) NULL,
  [Line] [nchar](20) NULL,
  [Quantity] [nchar](10) NULL,
  [IDBuild] [int] IDENTITY,
  CONSTRAINT [UQ__Build_Time__1B0907CE] UNIQUE ([IDBuild])
)
ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [ClusteredIndex-20150828-185050]
  ON [dbo].[Build_Time] ([Line])
  ON [PRIMARY]
GO

CREATE INDEX [idxPO_Number]
  ON [dbo].[Build_Time] ([PO_Number])
  ON [PRIMARY]
GO

CREATE INDEX [NonClusteredIndex-20150828-185212]
  ON [dbo].[Build_Time] ([Line])
  INCLUDE ([PO_Number], [ACS_Serial])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dlvn_TriggerRecordAssembly] ON [dbo].[Build_Time] 
FOR INSERT
AS
	declare @iPOSerial nchar(30)
	declare @iPONumber nchar(30)
	declare @iPOTotalQty int
	declare @iPOAssyQty int
	declare @iSector nchar(15)
	declare @iMin int
	
	declare @actual int
	declare @lost int
	declare @effi int
	declare @time int
	declare @targetPerDur int
	
	set nocount on
	
	begin
				
		DELETE FROM [DLVNDB].[dbo].[AssemblyRecord] WHERE DATEDIFF(DAY,AssemblyDateTime,GETDATE()-3) >= '0'
		
		SELECT TOP 1 @iPOSerial = ACS_Serial from inserted		
		SELECT TOP 1 @iPONumber = PO_Number from inserted	
		if NOT(exists(SELECT TOP 1 * FROM [DLVNDB].[dbo].[AssemblyRecord] WHERE Serial = @iPOSerial
		                                                              AND Sector IS NOT NULL))
			begin
				INSERT INTO [DLVNDB].[dbo].[AssemblyRecord] (PONumber,Model,Serial,AssemblyDateTime)
					   SELECT PO_Number,Model,ACS_Serial,Time_Build FROM inserted
			end
		/*
		SET @iSector = 'None'
		SET @iPONumber =RIGHT('0000' + rtrim(ltrim(@iPONumber)),9)			
			if exists(SELECT TOP 1 * FROM [DLVNDB].[dbo].[OpenPOPlanner] WHERE TopPONumber = @iPONumber	)
				begin
					SELECT TOP 1 @iSector = Sector FROM [DLVNDB].[dbo].[OpenPOPlanner] WHERE TopPONumber = @iPONumber
				end
		
		SELECT TOP 1 @actual = Actual, @lost = Lost, @effi = Efficiency, @iPONumber = PO, @time = Time, @targetPerDur = TargetPerDuration 
																				FROM [FinalAssy].[dbo].[HourlyReport2] 
																				Where PO = @iPONumber
																				ORDER BY Date,Time desc
		SELECT @iPOAssyQty = COUNT(Distinct ACS_Serial) FROM [FinalAssy].[dbo].[Build_Time]
														Where PO_Number = @iPONumber
		SELECT @iPOTotalQty = PO_Quantity FROM [FinalAssy].[dbo].[PO_Start]
									   WHERE PO_Number = @iPONumber
		
		if (@iPOAssyQty < @iPOTotalQty * 0.95)
			begin
				SELECT @iMin = datepart(minute,CONVERT (time, SYSDATETIME()))
				if(@iMin >= 10) AND (@iMin < 20)
					begin
						UPDATE HourlyReport2 SET Actual = CEILING(@actual * 0.95), 
												 Lost = @targetPerDur - CEILING(@actual * 0.95),
												 Efficiency = CEILING(@effi * 0.95),
												 Sector = @iSector
											 WHERE Time = @time AND PO = @iPONumber
													 
						return
					end
				
				if(@iMin >= 20) AND (@iMin < 25)
					begin
						UPDATE HourlyReport2 SET Actual = CEILING(@actual * 0.9), 
												 Lost = @targetPerDur - CEILING(@actual * 0.9),
												 Efficiency = CEILING(@effi * 0.9),
												 Sector = @iSector
											 WHERE Time = @time AND PO = @iPONumber
						return
					end
				
				if(@iMin >= 25) AND (@iMin < 30)
					begin
						UPDATE HourlyReport2 SET Actual = CEILING(@actual * 0.85), 
												 Lost = @targetPerDur - CEILING(@actual * 0.85),
												 Efficiency = CEILING(@effi * 0.85),
												 Sector = @iSector
											 WHERE Time = @time AND PO = @iPONumber
					return
					end
					
				if(@iMin >= 30) AND (@iMin < 35)
					begin
						UPDATE HourlyReport2 SET Actual = CEILING(@actual * 0.9), 
												 Lost = @targetPerDur - CEILING(@actual * 0.9),
												 Efficiency = CEILING(@effi * 0.8),
												 Sector = @iSector
											 WHERE Time = @time AND PO = @iPONumber
						return
					end
				
				if(@iMin >= 35) AND (@iMin < 40)
					begin
						UPDATE HourlyReport2 SET Actual = CEILING(@actual * 0.8), 
												 Lost = @targetPerDur - CEILING(@actual * 0.8),
												 Efficiency = CEILING(@effi * 0.8),
												 Sector = @iSector
											 WHERE Time = @time AND PO = @iPONumber
						return
					end
				
				if(@iMin >= 40) AND (@iMin < 52)
					begin
						UPDATE HourlyReport2 SET Actual = CEILING(@actual * 0.7), 
												 Lost = @targetPerDur - CEILING(@actual * 0.7),
												 Efficiency = CEILING(@effi * 0.7),
												 Sector = @iSector
											 WHERE Time = @time AND PO = @iPONumber
						return
					end
				
				if(@iMin >= 52) AND (@iMin < 56)
					begin
						UPDATE HourlyReport2 SET Actual = CEILING(@actual * 0.85), 
												 Lost = @targetPerDur - CEILING(@actual * 0.85),
												 Efficiency = CEILING(@effi * 0.85),
												 Sector = @iSector
											 WHERE Time = @time AND PO = @iPONumber
						return
					end
				
			end		
		*/
	end
GO