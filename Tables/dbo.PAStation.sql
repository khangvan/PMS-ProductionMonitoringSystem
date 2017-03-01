CREATE TABLE [dbo].[PAStation] (
  [StationID] [nchar](15) NOT NULL,
  [Description] [nchar](50) NULL,
  [Position] [nchar](10) NULL,
  CONSTRAINT [PK_PAStation] PRIMARY KEY CLUSTERED ([StationID])
)
ON [PRIMARY]
GO