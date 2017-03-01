CREATE TABLE [dbo].[ErrorComment] (
  [Date] [datetime] NULL,
  [Time] [int] NOT NULL,
  [Model] [nvarchar](9) NOT NULL,
  [Line] [nchar](10) NOT NULL,
  [Efficiency] [int] NOT NULL,
  [Comment] [nvarchar](50) NULL
)
ON [PRIMARY]
GO