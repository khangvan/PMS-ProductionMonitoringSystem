SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[dlsvn_POQtyAssemblied] 
	@iPONumber nchar(30),
	@result int OUT
AS
--Declare	
	set nocount on
begin
		
	if((SELECT datepart(hh,CONVERT (time, SYSDATETIME()))) = '23')
		begin
			DELETE FROM [FinalAssy].[dbo].[Build_Time] WHERE DATEDIFF(DAY,Time_Build,GETDATE()-30) >= '0'
		end
			
	if exists(select PO_Number FROM Build_Time)
		begin
			SELECT @result = COUNT(ACS_Serial) FROM Build_Time
							WHERE PO_Number = @iPONumber
		end
	else
		begin
			set @result = '0'
		end
	
	select @result as Result
	return
end
GO