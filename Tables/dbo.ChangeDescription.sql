CREATE TABLE [dbo].[ChangeDescription] (
  [Change_Number] [int] NOT NULL,
  [Change_No_Des] [nvarchar](50) NULL,
  [Status_Number] [decimal](2) NULL,
  [Status_Text] [nvarchar](50) NULL,
  [Create_Date] [date] NULL,
  [Valid_Date] [date] NULL,
  [Days] [int] NULL,
  [Created_By] [nvarchar](50) NULL,
  [Reason] [nvarchar](50) NULL,
  [Prod_Hier1] [nvarchar](50) NULL,
  [Cntrlr] [nchar](1) NULL,
  [Reason_Code_Des] [nvarchar](50) NULL,
  [Urgency_Code] [nchar](10) NULL,
  [Multisite_Production] [nvarchar](50) NULL,
  [Emergency_Des] [nvarchar](50) NULL,
  [ECO_Type_Des] [nchar](3) NULL,
  [Org] [nchar](3) NULL,
  [Serial_Number_Cut_In] [nchar](20) NULL,
  [Engineer] [nchar](25) NULL,
  [Matl_Group] [nvarchar](50) NULL,
  [Internal_Control] [nvarchar](250) NULL,
  [Status] [nchar](12) NULL,
  [Release_Date] [date] NULL,
  CONSTRAINT [PK_ChangeDescription] PRIMARY KEY CLUSTERED ([Change_Number])
)
ON [PRIMARY]
GO