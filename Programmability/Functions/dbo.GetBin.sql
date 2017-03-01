SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetBin]
( @ValueIn AS int ,
@binsize int ,
@type VARCHAR(20)
)
RETURNS varchar(10)
AS
BEGIN
DECLARE @RS varchar(10)
--DECLARE @binsize INT
--set @binsize =5

DECLARE @i int
Set @i =0
set @i= CAST(@ValueIn AS float) / CAST(@binsize AS float);
--set @i= CAST(9 AS float) / CAST(5 AS float);
--SELECT @i AS test
if (@type ='full')
begin
set @RS= (
	   SELECT '['+cast(@i*@binsize as VARCHAR(3))+'-'+ cast((@i+1)*@binsize as VARCHAR(3))+')'
	   )
end
if (@type ='max')
begin
set @RS= (
	   SELECT cast((@i+1)*@binsize as VARCHAR(3))
	   )
  RETURN @RS
end

if (@type ='min')
begin
set @RS= (
	   SELECT cast((@i+0)*@binsize as VARCHAR(3))
	   )
  RETURN @RS
end

RETURN @RS
END
GO