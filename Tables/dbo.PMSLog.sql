CREATE TABLE [dbo].[PMSLog] (
  [ID] [int] IDENTITY,
  [JobName] [varchar](100) NULL,
  [JobType] [nchar](30) NULL,
  [Last_event_date] [datetime] NULL
)
ON [PRIMARY]
GO