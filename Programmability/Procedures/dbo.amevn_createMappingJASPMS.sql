SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[amevn_createMappingJASPMS]
AS
BEGIN

; with cte as (
select distinct partnumber as JASSAP_Model, lineid JASLine, subline_id JASStation 
,pms.linename 'PMSLine'

from JOB_ASSIGNMENT_DB..MDB_003_Line_Desciption jas

 
inner JOIN 
(
SELECT distinct sap_model, LineName from FinalAssy..vPMSLineReportHourly ) pms
on jas.partnumber=pms.sap_model
)

SELECT DISTINCT JASStation, PMSLine, '' Status 
 into PMSJASMapping from cte

END
GO