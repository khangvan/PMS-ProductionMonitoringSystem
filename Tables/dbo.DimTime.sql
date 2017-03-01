CREATE TABLE [dbo].[DimTime] (
  [TimeKeyID] [int] NOT NULL,
  [TimeKey] [int] NOT NULL,
  [Time30] [varchar](8) NOT NULL,
  [Hour30] [tinyint] NOT NULL,
  [MinuteNumber] [tinyint] NOT NULL,
  [SecondNumber] [tinyint] NOT NULL,
  [TimeInSecond] [int] NOT NULL,
  [HourlyBucket] [varchar](15) NOT NULL,
  [DayTimeBucketGroupKey] [int] NOT NULL,
  [DayTimeBucket] [varchar](100) NOT NULL,
  [WorkingShiftName] [nchar](15) NULL,
  [WorkingShiftNumber] [int] NULL
)
ON [PRIMARY]
GO