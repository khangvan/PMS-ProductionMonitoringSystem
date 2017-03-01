CREATE TABLE [dbo].[HourlyReport] (
  [ID] [int] IDENTITY,
  [Model] [nchar](25) NULL,
  [Line] [nchar](25) NULL,
  [Target] [nchar](25) NULL,
  [Actual] [nchar](25) NULL,
  [Date] [date] NULL,
  [Time] [int] NULL,
  PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO