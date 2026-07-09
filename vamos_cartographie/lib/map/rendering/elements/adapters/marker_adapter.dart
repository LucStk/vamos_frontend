import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:flutter/material.dart';
import '/map/map.dart';

Marker toMarker(
  MarkerElement element,
  Id<Trip> tripId,
  MapStateNotifier mapStateNotifier,
) {
  return Marker(
    point: element.latLng,

    child: GestureDetector(
      onTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
      onDoubleTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
      child: element.buildMarker(),
    ),
  );
}

DragMarker toDragMarker(
  DragMarkerElement element,
  Id<Trip> tripId,
  MapStateNotifier mapStateNotifier,
) {
  return DragMarker(
    point: element.latLng,
    size: const Size(26, 26),

    builder: (_, LatLng latLng, isDragging) => GestureDetector(
      onTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
      onDoubleTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
      child: element.buildMarker(isDragging: isDragging),
    ),

    onDragStart: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragStartEvent(latLng)),

    onDragEnd: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragEndEvent(latLng)),
  );
}
