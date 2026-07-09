import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/vertex_ui_queries.dart';
import 'package:vamos_cartographie/features/waypoint/waypoint.dart';

class WaypointMarker extends ConsumerWidget {
  final TripId tripId;
  final VertexRef vertexRef;
  final Waypoint waypoint;
  final bool isDragging;

  const WaypointMarker({
    super.key,
    required this.tripId,
    required this.waypoint,
    required this.vertexRef,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(isVertexSelectedProvider(tripId, vertexRef));

    return CircleAvatar(
      radius: selected ? 32 : 20, // Taille globale du cercle (diamètre = 32)
      backgroundColor: Color(
        waypoint.poiCategoryUi.colorValue,
      ), // <-- La couleur de votre fond rond
      child: Icon(
        waypoint.poiCategoryUi.icon,
        color: Colors.white,
        size: selected ? 15 : 10,
      ),
    );
  }
}
