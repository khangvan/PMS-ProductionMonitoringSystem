SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GoBINwBAR]
( @ValueIn AS int 
)
RETURNS varchar(60)
AS
BEGIN

DECLARE @RS varchar(60)--, @ValueIn int
DECLARE @binsize INT
set @binsize =5
--set @ValueIn =199

DECLARE @i int
Set @i =0
set @i= CAST(@ValueIn AS float) / CAST(@binsize AS float);
--SELECT @i

DECLARE @stringn  varchar(60)
 SELECT   @stringn = ('['+cast((@i*@binsize) as VARCHAR(3))+'-'+ cast(((@i+1)*@binsize) as VARCHAR(3))+')')

  SELECT @RS=(right('--------------------------------------'+rtrim(@stringn), rtrim(LEN(@stringn)+@i)))
SELECT @RS=rtrim(right(@RS,60))
	   
  RETURN @RS

END
GO