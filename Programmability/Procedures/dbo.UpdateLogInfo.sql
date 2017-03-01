SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
Create procedure [dbo].[UpdateLogInfo]
@pkgid int,
@RecordCnt int
AS
BEGIN
update dbo.FileLoadInformation
set EndDateTime=getdate()
,RecordCnt=@RecordCnt
where PkgId=@pkgid
END
GO