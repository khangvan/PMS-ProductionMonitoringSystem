SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RPT_PDCurrentStatus]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN

declare @Currentdate datetime

select @Currentdate = GETDATE() 
	
END


/*
exec RPT_PDCurrentStatus
*/
GO