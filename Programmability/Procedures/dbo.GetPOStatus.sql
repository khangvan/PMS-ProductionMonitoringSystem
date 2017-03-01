SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

-- exec [GetPOStatus] '100865833'
-- =============================================
CREATE PROCEDURE [dbo].[GetPOStatus]
	@POnum nchar(20) ='100836186'
AS
BEGIN
DECLARE @Poqty int
DECLARE @Pocompleteqty int
DECLARE @PoRemain int


	select @Pocompleteqty =count(*) from FinalAssy.dbo.Build_Time bt WHERE bt.PO_Number =
	@Ponum
	PRINT rtrim(cast(@Pocompleteqty AS nchar(20)))
		
	SET @Poqty =-1 --kvan add
	select @Poqty=POQty from DLVNDB.dbo.OpenPOplanner WHERE topponumber =@ponum
	select @poremain = @Poqty-@Pocompleteqty
	PRINT rtrim(cast(@Poqty AS nchar(20)))
	PRINT rtrim(cast(@poremain AS nchar(20)))

	

	--SET @PoRemain =30
	IF @PoRemain <= 30  AND @PoRemain >0
	BEGIN
	 SELECT '!! Warning: con '+rtrim(cast(@poremain AS nchar(20)))+' ->PO:'+rtrim(cast(@ponum AS nchar(20))) +' |  '+rtrim(cast(@Poqty AS nchar(20)))+'-'+rtrim(cast(@Pocompleteqty AS nchar(20)))+'='+rtrim(cast(@poremain AS nchar(20)))
	 AS Result
	end
	IF @PoRemain = 0
	BEGIN
	 SELECT 'OKCompleted '+rtrim(cast(@poremain AS nchar(20)))+' ->PO:'+rtrim(cast(@ponum AS nchar(20))) +' |  '+rtrim(cast(@Poqty AS nchar(20)))+'-'+rtrim(cast(@Pocompleteqty AS nchar(20)))+'='+rtrim(cast(@poremain AS nchar(20)))
	AS Result
	   END
	   IF @PoRemain >30
	BEGIN
	 SELECT '>>'+rtrim(cast(@poremain AS nchar(20)))+' ->PO:'+rtrim(cast(@ponum AS nchar(20))) +' |  '+rtrim(cast(@Poqty AS nchar(20)))+'-'+rtrim(cast(@Pocompleteqty AS nchar(20)))+'='+rtrim(cast(@poremain AS nchar(20)))
	AS Result
	   END
	      IF @PoRemain <0 
	BEGIN
	 SELECT '?? LOI PO KO TON TAI'+rtrim(cast(@poremain AS nchar(20)))+' ->PO:'+rtrim(cast(@ponum AS nchar(20))) +' |  '+rtrim(cast(@Poqty AS nchar(20)))+'-'+rtrim(cast(@Pocompleteqty AS nchar(20)))+'='+rtrim(cast(@poremain AS nchar(20)))
	AS Result
	   END
	
	
END
GO