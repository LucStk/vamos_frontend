import "package:vamos_cartographie/features/waypoints/waypoints.dart";
import 'package:flutter/widgets.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/waypoints/waypoint_marker_view.dart';

typedef DragEndType = void Function(Waypoint, LatLng);
typedef OnWaypointLatLngType = void Function(Waypoint, LatLng);
// 1. Ceci n'est plus un Widget, c'est une fonction qui génère la configuration du marqueur

extension WaypointDragMarkerX on Waypoint {
  DragMarker toDragMarker({
    required DragEndType onDragEnd,
    required void Function(int waypointId) onTap,
    required OnWaypointLatLngType onDragUpdate,
  }) {
    return DragMarker(
      size: const Size(36, 36),
      point: latLng,
      onDragEnd: (_, latLng) {
        onDragEnd(this, latLng);
      },
      onDragUpdate: (details, latLng) {
        onDragUpdate(this, latLng);
      },
      builder: (_, _, isDragging) {
        return WaypointMarkerView(waypoint: this, isDragging: isDragging);
      },
      onTap: (LatLng latLng) {
        onTap(id);
      },
    );
  }
}
