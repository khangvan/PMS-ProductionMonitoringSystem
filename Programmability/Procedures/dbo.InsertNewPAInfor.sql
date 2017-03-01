SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewPAInfor]
	-- Add the parameters for the stored procedure here
@Serial nchar(15),
@Model nchar(15),
@StationID nchar(15),
@OpID nchar(10)

AS
BEGIN
Declare @time as datetime
Declare @timespan as int

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	set @time=(select TimeUp from PAInfor where Serial=@Serial and PAId=(select max(PAId) from PAInfor where Serial=@Serial))

	if (@time is null)
	--if (not exists(select  TimeUp  from PAInfor where Serial=@Serial)) 
	begin
		print('firsttime')
		insert into PAInfor(Serial, Model,StationID,OpID,TimeUp) values (@Serial,@Model,@StationID,@OpID, getdate())
	end
	else 
		begin
			print('secondtime')
			set @timespan = DATEDIFF(SECOND, @time,getdate())
			print @timespan
			if (@timespan>20)
				begin
					insert into PAInfor(Serial, Model,StationID,OpID,TimeUp) values (@Serial,@Model,@StationID,@OpID, getdate())
				end

		end 
	
END

--exec InsertNewPAInfor '20130757','2','1','1'
--select * from PAInfor

--delete from PAINFOR
GO