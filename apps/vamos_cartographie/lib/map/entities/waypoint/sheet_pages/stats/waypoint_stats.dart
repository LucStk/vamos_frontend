import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';

List<StatItem> waypointStatsOf(WaypointFields waypoint) {
  final p = waypoint.position;
  return [
    if (waypoint.kind != null)
      StatItem(
        icon: Icons.category_outlined,
        label: 'Catégorie',
        value: waypoint.kind!.name,
      ),
    StatItem(
      icon: Icons.route_outlined,
      label: 'Sur l\'itinéraire',
      // TODO: anchorPosition est-il en mètres ou en fraction (0–1) ?
      value: formatDistance(waypoint.anchorPosition),
    ),
    StatItem(
      icon: Icons.my_location,
      label: 'Coordonnées',
      value:
          '${p.latitude.toStringAsFixed(4)}, ${p.longitude.toStringAsFixed(4)}',
    ),
  ];
}
