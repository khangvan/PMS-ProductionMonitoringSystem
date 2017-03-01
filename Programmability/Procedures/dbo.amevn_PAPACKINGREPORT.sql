SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- amevn_PAPACKINGREPORT '02/12/2017 06:00','02/13/2017 06:00'
-- 

-- =============================================
CREATE PROCEDURE [dbo].[amevn_PAPACKINGREPORT]
	-- Add the parameters for the stored procedure here
	@ds datetime ,
	@de datetime 
AS
BEGIN


; WITH cte AS (

SELECT * FROM (
--SELECT 
--PONumber,  
--Model ,
--BoxNumber
--,count ( DISTINCT ( Serial ) ) AS PackingCount 
--,sum  ( QtyPerSN ) AS PackingCountSN 
--,convert(date,packingdatetime) PackingDate,datepart( hh,packingdatetime) PackingHour
--,'PackedType2S' AS PackingType 
--FROM dlvndb.dbo.postassypackedtype2S 
--WHERE PackingDateTime >= @ds
--AND PackingDateTime < @de
--GROUP BY 
--PONumber, 
--Model,
--boxnumber,
--convert(date,packingdatetime),datepart( hh,packingdatetime)



--union All
--(

--SELECT 
--PONumber,  
--Model ,
--BoxNumber
--,count ( DISTINCT ( Serial ) ) AS PackingCount 
--,sum  ( QtyPerSN ) AS PackingCountSN 
--,convert(date,packingdatetime) PackingDate,datepart( hh,packingdatetime) PackingHour
--,'PackedType2G' AS PackingType 
--FROM dlvndb.dbo.postassypackedtype2G 
--WHERE PackingDateTime >= @ds
--AND PackingDateTime < @de
--GROUP BY 
--PONumber, 
--Model,
--boxnumber,
--convert(date,packingdatetime),datepart( hh,packingdatetime)


--)
--UNION ALL
--(

--SELECT 
--PONumber,  
--Model ,
--BoxNumber
--,count ( ( Serial ) ) AS PackingCount 
--,sum  ( QtyPerSN ) AS PackingCountSN 
--,convert(date,packingdatetime) PackingDate,datepart( hh,packingdatetime) PackingHour
--,'PackedType0' AS PackingType 
--FROM dlvndb.dbo.PostAssypackedtype0 
--WHERE PackingDateTime >= @ds
--AND PackingDateTime < @de
--GROUP BY 
--PONumber, 
--Model,
--BoxNumber,
--convert(date,packingdatetime),datepart( hh,packingdatetime)

---- select  top 10 * from PostAssypackedtype0
--)
---- remove type1 vì Quý báo bên SMTpackignbox record đủ thông tin changedate: 18 Feb
----UNION ALL
----(-- select  top 10 * from PostAssypackedtype1

----SELECT 
----PONumber,  
----Model ,
----BoxNumber
----,''/*count ( ( Serial ) ) AS**/ PackingCount 
----,sum  ( QtyPerSN ) AS PackingCountSN 
----,convert(date,packingdatetime) PackingDate,datepart( hh,packingdatetime) PackingHour
----,'PackedType1' AS PackingType 
----FROM dlvndb.dbo.PostAssypackedtype1
----WHERE PackingDateTime >= @ds
----AND PackingDateTime < @de
----GROUP BY 
----PONumber, 
----Model,
----BoxNumber,
----convert(date,packingdatetime),datepart( hh,packingdatetime)


----)
--UNION ALL
--( -- select top 10 * from PostAssypackedtype2dlm

--SELECT 
--PONumber,  
--Model ,
--BoxNumber
--,count ( ( Serial ) ) AS PackingCount 
--,sum  ( QtyPerSN ) AS PackingCountSN 
--,convert(date,packingdatetime) PackingDate,datepart( hh,packingdatetime) PackingHour
--,'PackedType2dlm' AS PackingType 
--FROM dlvndb.dbo.PostAssypackedtype2dlm
--WHERE PackingDateTime >= @ds
--AND PackingDateTime < @de
--GROUP BY 
--PONumber, 
--Model,
--BoxNumber,
--convert(date,packingdatetime),datepart( hh,packingdatetime)

---- select  top 10 * from PostAssypackedtype0
--)
--UNION ALL
--(
SELECT 
PCBAPostAssyPONumber PONumber,  
PCBAPostAssyModel Model ,
PCBAPostAssyPackagedBoxID BoxNumber
,'' AS PackingCount 
,sum  ( PCBAPostAssyPackagedBoxQty ) AS PackingCountSN 
,convert(date,PCBAPostAssyPackagedDateTime) PackingDate,datepart( hh,PCBAPostAssyPackagedDateTime) PackingHour
,'SMTPCBAPackagedBoxIDRecord' AS PackingType 
FROM dlvndb.dbo.SMTPCBAPackagedBoxIDRecord
WHERE PCBAPostAssyPackagedDateTime >= @ds
AND PCBAPostAssyPackagedDateTime < @de
GROUP BY 
PCBAPostAssyPONumber, 
PCBAPostAssyModel,
PCBAPostAssyPackagedBoxID,
convert(date,PCBAPostAssyPackagedDateTime),datepart( hh,PCBAPostAssyPackagedDateTime)
--)--END

)t-- end for select in cte
)

SELECT cte.*, op.PackagingPICcode, op.PackagingPICName FROM cte
--WHERE dateadd(hh,cte.PackingHour,convert(datetime,packingdate)) >= '02/13/2017'
--AND dateadd(hh,cte.PackingHour,convert(datetime,packingdate))  <=  '02/14/2017' 
/*op*/
LEFT JOIN (

SELECT distinct PCBAPostAssyPackagedBoxID,PackagingPICcode, PackagingPICName FROM dlvndb.dbo.smtpcbapackagedboxidrecord)op
ON op.PCBAPostAssyPackagedBoxID =cte.BoxNumber
/*op*/
ORDER BY Packingtype,PackingDate, cte.PackingHour, cte.PONumber


END
GO