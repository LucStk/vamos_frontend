import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection/map_state_provider.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/drag_marker_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/marker_ui_element.dart';

Marker toMarker(
  MarkerUiElement element,
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
  DragMarkerUiElement element,
  Id<Trip> tripId,
  MapStateNotifier mapStateNotifier,
) {
  return DragMarker(
    point: element.latLng,
    size: const Size(32, 32),

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
