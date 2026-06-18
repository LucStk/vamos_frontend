import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/queries/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';

class WaypointMarker extends ConsumerWidget {
  final Id<Waypoint> waypointId;
  final Id<Trip> tripId;
  final bool isDragging;

  const WaypointMarker({
    super.key,
    required this.waypointId,
    required this.tripId,
    this.isDragging = false,
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
