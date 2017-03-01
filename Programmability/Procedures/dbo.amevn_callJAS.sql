SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[amevn_callJAS]
AS
BEGIN
 
select *,

CASE WHEN isnumeric(cast(Empl_ID AS varchar(20))) =1 then
	   case when  SUBSTRING(Empl_ID,1,2) <20 then 'ThoiVu'
	   when  SUBSTRING(Empl_ID,1,2) >=20  THEN 'ChinhThuc'
	   else 'NoOne'
	   END
	   ELSE 'NoOne'
end
as Empl_type from JOB_ASSIGNMENT_DB.dbo.P007_P008_Tracking tk
--LEFT JOIN (select Empl_ID Emp_ID,Empl_Name Emp_Name,Emp_Type from EmpType) et
--on tk.[Empl_ID] = et.Emp_ID
where  tk.Date > '1/1/2016'


-- select distinct empl_id from JOB_ASSIGNMENT_DB..P007_P008_Tracking
END

GO