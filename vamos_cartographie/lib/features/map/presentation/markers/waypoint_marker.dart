import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/marker_abstract.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/marker_popUp_shell.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/waypoint_pop_up.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';

class WaypointMarker extends AbstractMarker {
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
    return MarkerPopUpShell(
      tripId: tripId,
      latLng: vertex.latLng,
      popUp: WaypointPopUp(tripId: tripId),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: waypoint.type.color, width: 2),
          boxShadow: [
            BoxShadow(
              color: waypoint.type.color,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(waypoint.type.icon, color: Colors.white, size: 20),
      ),
    );
  }
}
