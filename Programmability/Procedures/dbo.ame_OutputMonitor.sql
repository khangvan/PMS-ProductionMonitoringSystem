SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[ame_OutputMonitor]
@station varchar(30),
@model varchar(15),
@day datetime,
@hour int,
@output int
AS
BEGIN


	if (not exists(
	select * from AMEOutputMonitor where station=@station
	and day=@day
	and hour=@hour
	and Model=@model))
		begin
			--print 'NO'
			insert into AMEOutputMonitor(station,Model,Day,hour,output) values(@station,@model,@day,@hour,@output)
		end
	else
		begin
			--print 'YES'
			update AMEOutputMonitor set output=@output where station=@station and hour=@hour and day=@day and Model=@model
		end
end



GO