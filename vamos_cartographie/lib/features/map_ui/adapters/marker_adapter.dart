import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/infrastructure/controllers/map_ctrl_provider.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/markers/marker_ui_element.dart';

Marker toMarker(MarkerUiElement element, Id<Trip> tripId, MapCtrl ctrl) {
  return Marker(
    point: element.latLng,

    child: GestureDetector(
      onTap: () => ctrl.onUiEvent(element.tapEvent()),
      onDoubleTap: () => ctrl.onUiEvent(element.tapEvent()),
      child: element.buildMarker(),
    ),
  );
}

DragMarker toDragMarker(
  DragMarkerUiElement element,
  Id<Trip> tripId,
  MapCtrl ctrl,
) {
  return DragMarker(
    point: element.latLng,
    size: const Size(32, 32),

    builder: (_, LatLng latLng, isDragging) => GestureDetector(
      onTap: () => ctrl.onUiEvent(element.tapEvent()),
      onDoubleTap: () => ctrl.onUiEvent(element.tapEvent()),
      child: element.buildMarker(isDragging: isDragging),
    ),

    onDragStart: (_, LatLng latLng) =>
        ctrl.onUiEvent(element.dragStartEvent(latLng)),

    onDragEnd: (_, LatLng latLng) =>
        ctrl.onUiEvent(element.dragEndEvent(latLng)),
  );
}
