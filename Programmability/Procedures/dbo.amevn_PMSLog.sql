SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[amevn_PMSLog]
	-- Add the parameters for the stored procedure here
	@JobName varchar(100) =NULL, @JobType varchar(30)=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT  INTO pmslog (JobName,JobType, Last_event_Date)
 values (@JobName,@JobType, getdate())



END
GO