import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/marker_shell.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/menus/menus.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import "map_marker.dart";

class WaypointMarker extends MapMarker {
  final Id<Waypoint> waypointId;

  const WaypointMarker({
    super.key,
    required this.waypointId,
    required super.tripId,
    super.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // debugPrint('WAYPOINT $waypointId BUILD');
    final waypoint = ref.watch(
      nodeRequiredProvider<Waypoint>(tripId, waypointId),
    );

    final vertex = ref.watch(
      nodeRequiredProvider<Vertex>(tripId, waypoint.vertexId),
    );
    return MarkerShell(
      tripId: tripId,
      latLng: vertex.latLng,
      popMenu: WaypointMenu(tripId: tripId),
      child: Icon(waypoint.type.icon, color: Colors.white, size: 20),
    );
  }
}
