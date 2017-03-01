SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO





/*
exec [GetLastPOBasewMan] '06/13/2016 6:00', '06/14/2016 06:00', 'HH01'


*/

-- =============================================
CREATE PROCEDURE [dbo].[GetLastPOBasewMan]
-- Add the parameters for the stored procedure here
  @first DateTime --='05/31/2016 6:00'
, @second DateTime --='06/01/2016 06:00'
, @line nvarchar(10)--='HH03'
AS
BEGIN


IF (getdate()< '05/31/2016')
BEGIN
PRINT 'old run'
	-- get man power

	--DECLARE @lastman int
	--DECLARE @default int
	--DECLARE @man int
	--SET @man =1 


	----get max
	--SELECT @default= cc.ManPW
	--,      @lastman= cc.LastestMan
	--from PTR.dbo.CapacityControl cc
	--WHERE cc.ProductGroup =
	--	(
	--	SELECT bt.Model
	--	from dbo.Build_Time bt
	--	WHERE bt.IDBuild=
	--		(SELECT max(bt.IDBuild)
	--		FROM dbo.Build_Time bt
	--		WHERE Time_Build BETWEEN @first AND @second AND
	--			bt.Line = @line)
	--		)

		
	--IF (@lastman<> @default AND @lastman <>0)
	--BEGIN
	--	SET @man =@lastman
	--END
	
	----SELECT @man
	----get manpower

	--	SELECT TOP 1 Time_Build,
	--	   PO_Number,
	--	   Model,
	--	   Quantity ,
	--	bt.Line,
	--	 @man AS Man,
	--	 @default as ManDF
	--	   FROM Build_Time bt, PTR.dbo.CapacityControl cc
	--	   WHERE
	--	bt.Model = cc.ProductGroup AND
	--	Time_Build BETWEEN @first AND @second AND
	--	   bt.Line = @line
	--	   ORDER BY Time_Build DESC
		
		END

---new
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
	


	 Time_Build = (
	 select max(Time_Build) FROM Build_Time 
	 WHERE

	-- Time_Build BETWEEN '06/13/2016 6:00' and '06/14/2016 06:00'
	--AND Line = 'hh01' 
	 Time_Build BETWEEN @first AND @second
	AND bt.Line = @line
	)
	/*
	
	SELECT TOP 1 Time_Build
,            PO_Number
,            Model
,            Quantity
,            bt.Line
,            '' AS Man
,            '' AS ManDF
--INTO ##tblBASE
FROM Build_Time              bt
WHERE
	 Time_Build = (
	 select max(Time_Build) FROM Build_Time 
	 WHERE
	 Time_Build BETWEEN '06/13/2016 6:00' and '06/14/2016 06:00'
	AND Line = 'hh01' 
	
	)
	*/

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
		

		SELECT tb.Time_Build,tb.PO_Number,tb.Model,tb.Quantity, tb.Line,@LastestMan AS Man, @SetupMan AS ManDF FROM ##tblBASE tb
END



END--end no delete

/*


*/
GO