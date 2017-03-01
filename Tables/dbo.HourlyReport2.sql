CREATE TABLE [dbo].[HourlyReport2] (
  [Date] [date] NULL,
  [Time] [int] NULL,
  [PO] [nvarchar](25) NULL,
  [Model] [nvarchar](25) NULL,
  [Actual] [int] NULL,
  [Lost] [int] NULL,
  [Efficiency] [int] NULL,
  [Total_Actual] [int] NULL,
  [Total_Lost] [int] NULL,
  [Total_Efficiency] [int] NULL,
  [Line] [nvarchar](15) NULL,
  [TargetPerHour] [int] NOT NULL DEFAULT (0),
  [IDHourlyReport2] [int] IDENTITY,
  [DurationPerHour] [int] NULL,
  [TargetPerDuration] [int] NULL,
  [Man] [int] NULL,
  [Sector] [nchar](15) NULL,
  PRIMARY KEY CLUSTERED ([IDHourlyReport2])
)
ON [PRIMARY]
GO