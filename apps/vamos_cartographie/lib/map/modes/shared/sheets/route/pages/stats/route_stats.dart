import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/stats/stat_item.dart';

/// Les stats de la route viennent surtout du calque de modalité.
List<StatItem> routeStatsOf(
  RouteFields route,
  List<MobilitySpanFields> spans,
) {
  final known = spans.map((s) => s.lengthM).whereType<double>();
  final total = known.isEmpty ? null : known.reduce((a, b) => a + b);

  // Modalité dominante : celle qui couvre la plus grande longueur.
  final byMobility = <MobilityType, double>{};
  for (final s in spans) {
    byMobility.update(
      s.mobilityType,
      (v) => v + (s.lengthM ?? 0),
      ifAbsent: () => s.lengthM ?? 0,
    );
  }
  final main = byMobility.entries.isEmpty
      ? null
      : byMobility.entries.reduce((a, b) => a.value >= b.value ? a : b).key;

  return [
    StatItem(icon: Icons.straighten, label: 'Distance', value: formatDistance(total)),
    StatItem(
      icon: Icons.directions_bike,
      label: 'Modalité principale',
      value: main?.name ?? '—',
    ),
    StatItem(icon: Icons.timeline, label: 'Sections', value: '${spans.length}'),
    StatItem(
      icon: Icons.scatter_plot_outlined,
      label: 'Points',
      value: '${route.geometry.length}',
    ),
  ];
}
