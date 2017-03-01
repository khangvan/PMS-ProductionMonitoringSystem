CREATE TABLE [dbo].[PAInfor] (
  [Serial] [nchar](15) NOT NULL,
  [Model] [nchar](15) NULL,
  [StationID] [nchar](15) NULL,
  [OpID] [nchar](10) NULL,
  [TimeUp] [datetime] NULL,
  [PAId] [int] IDENTITY,
  CONSTRAINT [PK_PAInfor] PRIMARY KEY CLUSTERED ([PAId])
)
ON [PRIMARY]
GO