import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/trip.dart';
import 'package:trip_domain/domain/waypoint.dart';

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
