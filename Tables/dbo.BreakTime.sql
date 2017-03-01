CREATE TABLE [dbo].[BreakTime] (
  [Time] [int] NULL,
  [Duration] [int] NULL,
  [Start] [int] NULL,
  [End] [int] NULL,
  [LineGroup] [nvarchar](15) NULL,
  [IDBrk] [int] IDENTITY,
  [Rate] [decimal] NULL,
  PRIMARY KEY CLUSTERED ([IDBrk])
)
ON [PRIMARY]
GO