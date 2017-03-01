CREATE TABLE [dbo].[ActionDescription] (
  [ECO] [int] NULL,
  [Action] [int] NULL,
  [Description] [nvarchar](100) NULL,
  [PIC] [nvarchar](50) NULL,
  [DueDate] [date] NULL,
  [Status] [nchar](10) NULL,
  [ID_No] [int] IDENTITY
)
ON [PRIMARY]
GO