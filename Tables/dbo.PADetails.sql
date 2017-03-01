CREATE TABLE [dbo].[PADetails] (
  [PADetail] [nchar](200) NULL,
  [TimeUp] [datetime] NULL,
  [ID] [int] IDENTITY,
  CONSTRAINT [PK_PADetails] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO