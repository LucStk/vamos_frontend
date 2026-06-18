import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/ui_events/ui_events.dart';

import 'package:vamos_cartographie/features/map/presentation/markers/markers.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/vamos_cartographie.dart';

DragMarkers waypointsMarkersbuild(
  MapCtrl mapCtrl,
  Id<Trip> tripId,
  List<Waypoint> waypoint,
) {
  final List<DragMarker> markers = [];
  for (final v in waypoint) {
    markers.add(
      DragMarker(
        point: v.vertexId,
        size: Size(32, 32),
        builder: (_, LatLng latLng, bool isDragging) => GestureDetector(
          onDoubleTap: () => mapCtrl.onUiEvent(WaypointDoubleTapped(v.id)),
          onTap: () => mapCtrl.onUiEvent(WaypointTapped(v.id)),
          child: WaypointMarker(
            tripId: tripId,
            waypointId: v.id,
            isDragging: isDragging,
          ),
        ),
        onDragStart: (_, _) => mapCtrl.onUiEvent(WaypointDragStarted(v.id)),
        onDragEnd: (details, latLng) =>
            mapCtrl.onUiEvent(WaypointDragEndend(v.id)),
      ),
    );
  }
  return DragMarkers(markers: markers);
}
