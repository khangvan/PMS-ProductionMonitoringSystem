CREATE TABLE [dbo].[PMSOrderReport] (
  [ProdOrder] [nvarchar](12) NULL,
  [SAP_model] [nvarchar](30) NULL,
  [Linename] [nvarchar](20) NULL,
  [AssemblyQty] [int] NULL,
  [RefStartDate] [datetime] NULL,
  [RefEnddate] [datetime] NULL,
  [RefTotal] [int] NULL,
  [LoadDate] [datetime] NULL,
  [ChangeDate] [datetime] NULL
)
ON [PRIMARY]
GO