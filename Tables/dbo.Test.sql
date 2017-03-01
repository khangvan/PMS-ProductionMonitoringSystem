CREATE TABLE [dbo].[Test] (
  [LastName] [nchar](10) NULL,
  [FirstName] [nchar](10) NULL,
  [ID] [int] IDENTITY,
  CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO