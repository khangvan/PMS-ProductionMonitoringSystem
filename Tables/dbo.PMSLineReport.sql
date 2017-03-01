CREATE TABLE [dbo].[PMSLineReport] (
  [Linename] [nchar](20) NULL,
  [sap_model] [nchar](30) NULL,
  [AssemblyQty] [int] NULL,
  [RefStartDate] [datetime] NULL,
  [RefEnddate] [datetime] NULL,
  [RefTotalMin] [int] NULL,
  [LoadDate] [datetime] NULL,
  [ChangeDate] [datetime] NULL
)
ON [PRIMARY]
GO