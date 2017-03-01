SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MappingColumnInsert]
	-- Add the parameters for the stored procedure here
	@dbColumn nvarchar(50),
	@exColumn nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO [dbo].[MappingColumn]
           ([DatabaseName]
           ,[ExcelName])
     VALUES
           (@dbColumn, @exColumn)
END
GO