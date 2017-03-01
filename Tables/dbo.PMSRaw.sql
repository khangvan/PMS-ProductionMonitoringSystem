CREATE TABLE [dbo].[PMSRaw] (
  [ID] [int] IDENTITY,
  [Linename] [nchar](20) NULL,
  [ProdOrder] [nchar](12) NULL,
  [SAP_model] [nchar](30) NULL,
  [ACS_Serial] [nchar](30) NULL,
  [Last_event_date] [datetime] NULL,
  [LoadDate] [datetime] NULL,
  [ChangeDate] [datetime] NULL
)
ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [ClusteredIndex-20161205-134210]
  ON [dbo].[PMSRaw] ([ProdOrder], [SAP_model], [ACS_Serial])
  ON [PRIMARY]
GO