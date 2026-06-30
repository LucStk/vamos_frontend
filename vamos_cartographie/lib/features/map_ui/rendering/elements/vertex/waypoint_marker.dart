import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/queries/waypoint_ui_queries.dart';

class WaypointMarker extends ConsumerWidget {
  final WaypointId waypointId;
  final bool isDragging;

  const WaypointMarker({
    super.key,
    required this.waypointId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointUiProvider(waypointId));
    if (waypoint == null) {
      return SizedBox.shrink();
    }
    return CircleAvatar(
      radius: 16, // Taille globale du cercle (diamètre = 32)
      backgroundColor: Color(
        waypoint.poiCategoryUi.colorValue,
      ), // <-- La couleur de votre fond rond
      child: Icon(waypoint.poiCategoryUi.icon, color: Colors.white, size: 20),
    );
  }
}
