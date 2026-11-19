import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/stats/stats_compact.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/route/pages/overview/route_overview_compact.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/route/pages/overview/route_overview_viewer.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/route/pages/stats/route_sections_list.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/route/pages/stats/route_stats.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

List<SheetPage> routeSheetPages(
  RouteFields route,
  List<MobilitySpanFields> spans, {
  bool editable = false,
}) {
  final stats = routeStatsOf(route, spans);
  return [
    SheetPage(
      label: 'Aperçu',
      icon: Icons.photo_library_outlined,
      selectedIcon: Icons.photo_library,
      compact: SheetCompact(
        child: RouteOverviewCompact(route: route, editable: editable),
      ),
      expanded: RouteOverviewViewer(route: route, editable: editable),
    ),
    SheetPage(
      label: 'Statistiques',
      icon: Icons.bar_chart_outlined,
      selectedIcon: Icons.bar_chart,
      compact: SheetCompact(
        child: StatsCompact(title: 'Statistiques', stats: stats),
      ),
      expanded: RouteSectionsList(stats: stats, spans: spans),
    ),
  ];
}
