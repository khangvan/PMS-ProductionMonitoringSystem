SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vPMSLineReportEfficiency]
AS
SELECT        TOP (100) PERCENT CASE WHEN Hour30 >= 0 AND Hour30 < 6 THEN DATEADD(day, - 1, dd.Date) ELSE dd.Date END AS Event_date, dt.Hour30 AS Event_hour, 
                         dt.WorkingShiftName AS Shift, pr.Linename, pr.sap_model, pr.AssemblyQty, 
                         CASE WHEN dcc.TargetHRS = 0 THEN 'NotDefine' WHEN dcc.TargetHRS > 0 THEN dcc.TargetHRS ELSE isnull(dcc.TargetHRS, 'NotDefine') END AS Target60Min, 
                         dbt.Brk_UsingMin AS AvaiTime, dbt.Brk_UsingPercentValue AS AvaiRate, 
                         ISNULL(CASE WHEN dcc.TargetHRS <= 0 THEN '0' ELSE ROUND(CAST(pr.AssemblyQty AS float) / (CAST(dcc.TargetHRS AS float) + 0.0001) 
                         / CAST(dbt.Brk_UsingPercentValue AS float) * 100, 2) END, 0) AS Efficiency, 
                         ISNULL(CASE WHEN dcc.TargetHRS <= 0 THEN '-1000' WHEN dcc.TargetHRS = '1000' THEN '-1000' ELSE ROUND(((CAST(dcc.TargetHRS AS float) + 0.0001) 
                         / CAST(dbt.Brk_UsingPercentValue AS float)) - CAST(pr.AssemblyQty AS float), 0) END, '-1000') AS Lost, pr.RefStartDate, pr.RefEnddate, pr.RefTotalMin, pr.LoadDate, 
                         pr.ChangeDate, dcc.ManPower, dcc.ManPower AS ManPowerAtCrHr, CAST(dd.DateKey AS varchar(8)) + CAST(DATEPART(hour, pr.RefStartDate) AS varchar(10)) 
                         AS DateHourKey
FROM            dbo.PMSLineReport AS pr LEFT OUTER JOIN
                         dbo.DimDate AS dd ON dd.DateKey = REPLACE(CONVERT(varchar, pr.RefStartDate, 102), '.', '') LEFT OUTER JOIN
                         dbo.DimTime AS dt ON dt.TimeKey = REPLACE(CONVERT(VARCHAR, pr.RefStartDate, 108), ':', '') LEFT OUTER JOIN
                         dbo.DimCapacityControl AS dcc ON dcc.Sap_model = pr.sap_model LEFT OUTER JOIN
                         dbo.DimBreakTime AS dbt ON dbt.Brk_Hour = DATEPART(HOUR, pr.RefStartDate)
ORDER BY pr.RefStartDate DESC
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[13] 4[13] 2[59] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "pr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dd"
            Begin Extent = 
               Top = 87
               Left = 771
               Bottom = 216
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dt"
            Begin Extent = 
               Top = 6
               Left = 481
               Bottom = 135
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dcc"
            Begin Extent = 
               Top = 136
               Left = 38
               Bottom = 265
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "dbt"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 267
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
En', 'SCHEMA', N'dbo', 'VIEW', N'vPMSLineReportEfficiency'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane2', N'd
', 'SCHEMA', N'dbo', 'VIEW', N'vPMSLineReportEfficiency'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 2, 'SCHEMA', N'dbo', 'VIEW', N'vPMSLineReportEfficiency'
GO