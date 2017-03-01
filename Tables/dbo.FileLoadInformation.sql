CREATE TABLE [dbo].[FileLoadInformation] (
  [PkgId] [int] IDENTITY,
  [PackageName] [varchar](100) NULL,
  [FileName] [varchar](100) NULL,
  [RecordCnt] [int] NULL,
  [StartDateTime] [datetime] NULL,
  [EndDateTime] [datetime] NULL
)
ON [PRIMARY]
GO