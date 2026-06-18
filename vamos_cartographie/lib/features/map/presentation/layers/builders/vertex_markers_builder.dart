import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/ui_events/ui_events.dart';

import 'package:vamos_cartographie/features/map/presentation/markers/markers.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/vamos_cartographie.dart';

DragMarkers vertexMarkersbuild(
  MapCtrl mapCtrl,
  Id<Trip> tripId,
  List<Vertex> vertex,
) {
  final List<DragMarker> markers = [];
  for (final v in vertex) {
    markers.add(
      DragMarker(
        point: v.latLng,
        size: Size(32, 32),
        builder: (_, LatLng latLng, bool isDragging) => VertexMarker(
          tripId: tripId,
          vertexId: v.id,
          isDragging: isDragging,
        ),
        onTap: (_) => mapCtrl.onUiEvent(VertexTapped(v.id)),
        onDragStart: (_, _) => mapCtrl.onUiEvent(VertexDragStarted(v.id)),
        onDragEnd: (details, latLng) =>
            mapCtrl.onUiEvent(VertexDragEndend(v.id)),
      ),
    );
  }
  return DragMarkers(markers: markers);
}
