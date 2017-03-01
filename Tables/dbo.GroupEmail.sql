CREATE TABLE [dbo].[GroupEmail] (
  [Name] [nvarchar](50) NULL,
  [Email] [nvarchar](50) NULL,
  [Group] [nchar](20) NULL,
  [IDEmail] [int] IDENTITY,
  PRIMARY KEY CLUSTERED ([IDEmail])
)
ON [PRIMARY]
GO