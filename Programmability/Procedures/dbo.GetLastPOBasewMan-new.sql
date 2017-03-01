SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO





/*
exec [GetLastPOBasewMan-new] '05/31/2016 6:00', '06/01/2016 06:00', 'HH04'


*/

---- =============================================
CREATE PROCEDURE [dbo].[GetLastPOBasewMan-new]
-- Add the parameters for the stored procedure here
  @first DateTime ='05/31/2016 6:00'
, @second DateTime ='06/01/2016 06:00'
, @line nvarchar(10)='HH03'
AS
BEGIN


IF (getdate()< '05/31/2016')
BEGIN
PRINT 'old run'
END
IF (getdate()> '05/31/2016')
BEGIN
PRINT 'now run'

---new change

/*
create #tempbase to store data
get last record+ calucating for base
get man then set defaut

*/
IF OBJECT_ID('tempdb..##tblBASE') IS NOT NULL
/*Then it exists*/ DROP TABLE ##tblBASE
SELECT TOP 1 Time_Build
,            PO_Number
,            Model
,            Quantity
,            bt.Line
,            '' AS Man
,            '' AS ManDF
INTO ##tblBASE
FROM Build_Time              bt
WHERE
	 Time_Build BETWEEN @first AND @second
	AND bt.Line = @line



	-- get man power
	DECLARE @LastestMan int, @SetupMan int, @man int
	SET @man =1 
	SET @LastestMan=1
	SET @SetupMan=1
	
	SELECT @SetupMan= cc.ManPW
	,      @LastestMan= cc.LastestMan
	from PTR.dbo.CapacityControl cc
	WHERE cc.ProductGroup =
		(
		SELECT TOP 1 Model
		from ##tblBASE
		)
		
	--IF (@LastestMan<> @SetupMan)
	--BEGIN
	--	SET @man =@LastestMan
	--END

	--SELECT @LastestMan
	--SELECT @man
	--SELECT @SetupMan

	--UPDATE ##tblBASE
	--SET
	--    ##tblBASE.Man = @man, -- unknown type
	--    ##tblBASE.ManDF = @SetupMan -- unknown type
	-- WHERE ##tblBASE.Man =''
	--SELECT @man
	--get manpower

		--SELECT TOP 1 Time_Build,
		--   PO_Number,
		--   Model,
		--   Quantity ,
		--bt.Line,
		-- @man AS Man,
		-- @default as ManDF
		--   FROM Build_Time bt, PTR.dbo.CapacityControl cc
		--   WHERE
		--bt.Model = cc.ProductGroup AND
		--Time_Build BETWEEN @first AND @second AND
		--   bt.Line = @line
		--   ORDER BY Time_Build DESC
		SELECT tb.Time_Build,tb.PO_Number,tb.Model,tb.Quantity, tb.Line,@LastestMan AS Man, @SetupMan AS ManDF FROM ##tblBASE tb
END


END


GO