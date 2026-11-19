import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/stats/stats_compact.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/stats/stats_list.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/waypoint/pages/overview/waypoint_overview_compact.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/waypoint/pages/overview/waypoint_overview_viewer.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/waypoint/pages/stats/waypoint_stats.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

List<SheetPage> waypointSheetPages(
  TripId tripId,
  WaypointFields waypoint, {

  bool editable = false,
}) {
  final stats = waypointStatsOf(waypoint);
  return [
    SheetPage(
      label: 'Aperçu',
      icon: Icons.photo_library_outlined,
      selectedIcon: Icons.photo_library,
      compact: SheetCompact(
        child: WaypointOverviewCompact(
          tripId: tripId,
          waypoint: waypoint,
          editable: editable,
        ),
      ),
      expanded: WaypointOverviewViewer(
        tripId: tripId,
        waypoint: waypoint,
        editable: editable,
      ),
    ),
    SheetPage(
      label: 'Détails',
      icon: Icons.info_outline,
      selectedIcon: Icons.info,
      compact: SheetCompact(
        child: StatsCompact(title: 'Détails', stats: stats),
      ),
      expanded: StatsList(stats: stats),
    ),
  ];
}
