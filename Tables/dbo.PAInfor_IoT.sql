CREATE TABLE [dbo].[PAInfor_IoT] (
  [Serial] [nchar](15) NULL,
  [Model] [nchar](15) NULL,
  [StationID] [nchar](15) NULL,
  [OpID] [nchar](10) NULL,
  [TimeUp] [datetime] NULL,
  [PAId] [int] IDENTITY,
  CONSTRAINT [PK_PAInfor_IoT] PRIMARY KEY CLUSTERED ([PAId])
)
ON [PRIMARY]
GO