import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/marker_abstract.dart';
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
    final waypoint = ref.watch(
      nodeRequiredProvider<Waypoint>(tripId, waypointId),
    );

    return CircleAvatar(
      radius: 16, // Taille globale du cercle (diamètre = 32)
      backgroundColor:
          waypoint.poiCategory.color, // <-- La couleur de votre fond rond
      child: Icon(waypoint.poiCategory.icon, color: Colors.white, size: 20),
    );
  }
}
