SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewScanner]
	-- Add the parameters for the stored procedure here
	@PO_Number nchar(12),
	@ACS_Serial nchar(15),
	@Model nchar(15),
	@Line nchar(20),
	@Quantity nchar(10)
AS
BEGIN

declare @datetime  datetime
select @datetime = getdate()

insert into Build_Time(PO_Number, ACS_Serial,Time_Build,Model,Line, Quantity) values (@PO_Number,@ACS_Serial,@datetime,@Model,@Line,@Quantity)


END


/*

select top 100 * from Build_Time where acs_serial='abcdef1'
exec [InsertNewScanner]
*/
GO