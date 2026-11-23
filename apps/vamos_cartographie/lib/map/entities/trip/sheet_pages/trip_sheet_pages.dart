import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stats_compact.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/overview/trip_overview_compact.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/overview/trip_overview_viewer.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/stats/trip_stats.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/stats/trip_stats_view.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

List<SheetPage> tripSheetPages(Trip trip, {bool editable = false}) {
  final stats = tripStatsOf(trip);
  return [
    SheetPage(
      label: 'Aperçu',
      icon: Icons.photo_library_outlined,
      selectedIcon: Icons.photo_library,
      compact: SheetCompact(
        child: TripOverviewCompact(trip: trip, editable: editable),
      ),
      expanded: TripOverviewViewer(trip: trip, editable: editable),
    ),
    SheetPage(
      label: 'Statistiques',
      icon: Icons.bar_chart_outlined,
      selectedIcon: Icons.bar_chart,
      compact: SheetCompact(
        child: StatsCompact(title: 'Statistiques', stats: stats),
      ),
      expanded: TripStatsView(trip: trip),
    ),
  ];
}
