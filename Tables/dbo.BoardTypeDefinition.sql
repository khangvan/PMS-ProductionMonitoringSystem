CREATE TABLE [dbo].[BoardTypeDefinition] (
  [Model] [nchar](15) NOT NULL,
  [BoardType] [bit] NOT NULL,
  [BoardPerPanel] [int] NULL,
  CONSTRAINT [PK_BoardTypeDefinition] PRIMARY KEY CLUSTERED ([Model])
)
ON [PRIMARY]
GO