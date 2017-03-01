SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vPMSJASMappingModel] AS 
select distinct partnumber as JASSAP_Model, lineid JASLine, subline_id JASStation 
,pms.linename 'PMSLine'

from JOB_ASSIGNMENT_DB..MDB_003_Line_Desciption as jas

 
inner JOIN 
(
SELECT distinct sap_model, LineName from FinalAssy..vPMSLineReportHourly ) pms
on jas.partnumber=pms.sap_model
GO