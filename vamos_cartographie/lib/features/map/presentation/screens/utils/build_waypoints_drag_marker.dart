import 'package:flutter/widgets.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';

typedef DragEndType = void Function(Waypoint, LatLng, DragEndDetails);
typedef OnTapType = void Function(Waypoint, LatLng);
// 1. Ceci n'est plus un Widget, c'est une fonction qui génère la configuration du marqueur
DragMarker buildWaypointDragMarker({
  required Waypoint waypoint,
  required DragEndType dragEnd,
  required OnTapType onTap,
}) {
  return DragMarker(
    size: const Size(36, 36),
    point: waypoint.latLng,
    onDragUpdate: (details, latLng) {},
    // N'oubliez pas d'appeler votre callback dragEnd ici !
    onDragEnd: (details, latLng) {
      dragEnd(waypoint, latLng, details);
    },
    builder: (_, _, isDragging) {
      // WaypointMarker lui, est bien un widget !
      return WaypointMarker(waypoint: waypoint, isDragging: isDragging);
    },
    onTap: (LatLng latLng) {
      onTap(waypoint, latLng);
    },
  );
}

DragMarkers buildWaypointsDragMarkers({
  required List<Waypoint> waypoints,
  required DragEndType dragEnd,
  required OnTapType onTap,
}) {
  return DragMarkers(
    markers: [
      ...waypoints.map((waypoint) {
        return buildWaypointDragMarker(
          waypoint: waypoint,
          dragEnd: dragEnd,
          onTap: onTap,
        );
      }),
    ],
  );
}
