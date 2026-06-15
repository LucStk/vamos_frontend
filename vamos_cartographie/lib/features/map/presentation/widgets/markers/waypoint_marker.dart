import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import "map_marker.dart";

class WaypointMarker extends MapMarker {
  final Id<Waypoint> waypointId;
  final bool isDragging;

  const WaypointMarker({
    super.key,
    required this.waypointId,
    required super.tripId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // debugPrint('WAYPOINT $waypointId BUILD');
    final waypoint = ref.watch(
      nodeRequiredProvider<Waypoint>(tripId, waypointId),
    );
    return Container(
      decoration: BoxDecoration(
        color: isDragging
            ? waypoint.type.color.withOpacity(0.7)
            : waypoint.type.color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: isDragging ? 8 : 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(waypoint.type.icon, color: Colors.white, size: 20),
    );
  }
}
