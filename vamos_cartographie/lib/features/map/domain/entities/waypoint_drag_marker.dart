import 'package:flutter/widgets.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:vamos_cartographie/features/map/map.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';
import 'package:latlong2/latlong.dart';

class WaypointDragMarker extends StatelessWidget {
  final Function(Waypoint, LatLng, DragEndDetails) dragEnd;
  final Waypoint waypoint;
  const WaypointDragMarker({
    super.key,
    required this.waypoint,
    required this.dragEnd,
  });
  @override
  Widget build(BuildContext context) {
    return DragMarker(
      size: const Size(36, 36),
      point: waypoint.latLng,
      onDragUpdate: (details, latLng) {},
      builder: (_, _, isDragging) {
        return WaypointMarker(waypoint: waypoint, isDragging: isDragging);
      },
    )
  }
}
