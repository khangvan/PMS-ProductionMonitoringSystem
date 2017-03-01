CREATE TABLE [dbo].[LineName] (
  [Line_Name] [nchar](20) NOT NULL,
  [Stations] [char](30) NULL,
  [LineGroup] [nvarchar](15) NULL,
  [ShiftCapacity] [int] NOT NULL DEFAULT (0),
  [InputMode] [nchar](10) NULL,
  PRIMARY KEY CLUSTERED ([Line_Name])
)
ON [PRIMARY]
GO