SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[amevn_ScheduleUpdateMaxCapacity]
AS
BEGIN



  ;WITH source as (
  SELECT pms.sap_model, pms.MaxRun FROM (
	 SELECT sap_model, assemblyqty AS MaxRun,
	   ROW_NUMBER()OVER(PARTITION BY sap_model ORDER BY assemblyqty desc  )As RowNum
	   FROM [FinalAssy].[dbo].[vPMSLineReportEfficiency]  
	   )pms
    WHERE pms.RowNum=1
    )
    --SELECT * FROM source
    
 MERGE dimcapacitycontrol AS t
 USING source AS s 
 ON t.sap_model = s.sap_model
 WHEN MATCHED THEN
 UPDATE SET t.maxrun=s.maxrun
 , t.changedate =getdate()
 --WHEN MATCHED and t.TargetHRS =1000 THEN
 --UPDATE SET t.TargetHRS=s.maxrun
 WHEN NOT MATCHED BY TARGET
 THEN INSERT ( Sap_model, TargetHRS, LoadDate,  MaxRun )
 VALUES (s.sap_model,s.maxrun,getdate(),s.maxrun)
 ;

select * from DimCapacityControl
END
GO