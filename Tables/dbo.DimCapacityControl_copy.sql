CREATE TABLE [dbo].[DimCapacityControl_copy] (
  [ID] [int] NULL,
  [Sap_model] [varchar](30) NULL,
  [TargetHRS] [varchar](10) NULL,
  [Line] [nvarchar](50) NULL,
  [ManPower] [int] NULL,
  [LoadDate] [datetime] NULL,
  [ChangeDate] [datetime] NULL,
  [TargetSHIFT] [int] NOT NULL DEFAULT (0),
  [MaxRun] [int] NULL
)
ON [PRIMARY]
GO