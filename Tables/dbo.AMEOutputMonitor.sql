CREATE TABLE [dbo].[AMEOutputMonitor] (
  [Station] [nchar](30) NULL,
  [Model] [nchar](15) NULL,
  [Day] [date] NULL,
  [Hour] [int] NULL,
  [Output] [int] NULL,
  [ID] [int] IDENTITY,
  CONSTRAINT [PK_AMEOutputMonitor] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO