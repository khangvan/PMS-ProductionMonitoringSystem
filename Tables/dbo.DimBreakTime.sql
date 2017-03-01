CREATE TABLE [dbo].[DimBreakTime] (
  [Brk_ID] [int] IDENTITY,
  [Brk_Hour] [int] NULL,
  [Brk_BreakMin] [int] NULL,
  [Brk_UsingMin] [int] NULL,
  [Brk_UsingPercentValue] [decimal](5, 2) NULL,
  PRIMARY KEY CLUSTERED ([Brk_ID]),
  CONSTRAINT [chk_DimBreakTime_Brk_UsingPercentValue] CHECK ([Brk_UsingPercentValue]>=(0) AND [Brk_UsingPercentValue]<=(1))
)
ON [PRIMARY]
GO