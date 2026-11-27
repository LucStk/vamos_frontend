import 'package:material_ui/material_ui.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';

/// Les détails d'un waypoint. [distanceFromStartM] : sa distance le long de
/// la route depuis le départ, si on la connaît.
List<StatItem> waypointStatsOf(
  WaypointFields waypoint, {
  double? distanceFromStartM,
}) {
  final p = waypoint.position;
  return [
    if (waypoint.kind != null)
      StatItem(
        icon: Icons.category_outlined,
        label: 'Catégorie',
        value: waypoint.kind.display.label,
      ),
    if (waypoint.stay != null)
      const StatItem(
        icon: Icons.hotel_outlined,
        label: 'Halte',
        value: 'Fin d’étape',
      ),
    if (distanceFromStartM != null)
      StatItem(
        icon: Icons.route_outlined,
        label: 'Depuis le départ',
        value: formatDistance(distanceFromStartM),
      ),
    StatItem(
      icon: Icons.my_location,
      label: 'Coordonnées',
      value:
          '${p.latitude.toStringAsFixed(4)}, ${p.longitude.toStringAsFixed(4)}',
    ),
  ];
}
