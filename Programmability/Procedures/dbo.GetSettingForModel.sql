SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSettingForModel]
-- Add the parameters for the stored procedure here

 @Model nvarchar(20)
 
--,@lastMan int OUT,
--@ManDF int OUT


as
BEGIN
DECLARE @target int
DECLARE @lastMan  int
DECLARE @ManDF int

	-- get man power
SELECT @target= cc.TargetHRS,
@lastMan = cc.LastestMan, @ManDF = cc.ManPW 
FROM ptr.dbo.CapacityControl cc WHERE cc.ProductGroup = @Model
		
	--	IF (@lastMan<> @ManDF AND @lastMan <>0)
	--BEGIN
	--	SET @ManDF =@lastMan
	--END
	IF (NOT EXISTS (SELECT   TargetHRS FROM ptr.dbo.CapacityControl cc WHERE cc.ProductGroup = @Model))
	BEGIN
	set @target= 100
	END

	IF (@lastMan='' OR @lastMan =0)
	BEGIN
	set @lastMan= @ManDF
	END
	IF (NOT EXISTS (SELECT   LastestMan FROM ptr.dbo.CapacityControl cc WHERE cc.ProductGroup = @Model))
	BEGIN
	set @lastMan= @ManDF
	END


IF (NOT EXISTS (SELECT   TargetHRS,  ManPW AS ManDF,  @lastMan AS Man, LastUpdate FROM ptr.dbo.CapacityControl cc WHERE cc.ProductGroup = @Model))
	BEGIN
	SET @Model='NOMODEL'
	SET @lastMan =1
	SELECT   TargetHRS,  @lastMan AS ManDF,  @lastMan AS Man, LastUpdate FROM ptr.dbo.CapacityControl cc WHERE cc.ProductGroup = @Model
	RETURN
	END
	
SELECT   TargetHRS,  ManPW AS ManDF,  @lastMan AS Man, LastUpdate FROM ptr.dbo.CapacityControl cc WHERE cc.ProductGroup = @Model


END

/*

SELECT TOP 1 Time_Build,
PO_Number,
Model,
Quantity ,
bt.Line,
cc.ManPW
FROM Build_Time bt, PTR.dbo.CapacityControl cc
WHERE
bt.Model = cc.ProductGroup AND
Time_Build BETWEEN @first AND @second AND
bt.Line = @line
ORDER BY Time_Build DESC

*/
GO