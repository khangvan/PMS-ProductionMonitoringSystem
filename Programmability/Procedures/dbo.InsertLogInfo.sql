SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--Create Procedure To Insert Information Before Data Flow Task Start
Create procedure [dbo].[InsertLogInfo]
@PackageName VARCHAR(100),
@fileName VARCHAR(100),
@PkgID int output
AS
BEGIN
insert into dbo.FileLoadInformation (PackageName,FileName,StartDateTime)
values ( @PackageName,@fileName,getdate())

Set @PkgID= SCOPE_IDENTITY()
return
END
GO