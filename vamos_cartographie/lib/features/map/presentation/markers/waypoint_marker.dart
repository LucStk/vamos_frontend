import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/pop_up_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/marker_abstract.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/waypoint_pop_up.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/dialogs/show_waypoint_dialog.dart';

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

    return GestureDetector(
      onTap: () {
        if (!isDragging) {
          ref
              .read(mapPopupProvider(tripId).notifier)
              .toggle(
                latLng: vertex.latLng,
                popUp: WaypointPopUp(
                  tripId: tripId,
                  vertexId: waypoint.vertexId,
                ),
              );
        }
      },
      onDoubleTap: () {
        ShowWaypointDialog.show(
          context: context,
          waypointId: waypoint.id,
          tripId: tripId,
        );
      },
      child: CircleAvatar(
        radius: 16, // Taille globale du cercle (diamètre = 32)
        backgroundColor:
            waypoint.poiCategory.color, // <-- La couleur de votre fond rond
        child: Icon(waypoint.poiCategory.icon, color: Colors.white, size: 20),
      ),
    );
  }
}
