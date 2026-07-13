import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:flutter/material.dart';
import '/map/map.dart';

DragMarker toVertexMarker(
  VertexElement element,
  Id<Trip> tripId,
  MapStateNotifier mapStateNotifier,
  bool disableDrag, // 👈 nouveau paramètre
) {
  const totalSize = 26.0;
  return DragMarker(
    point: element.latLng,
    size: const Size(totalSize, totalSize),
    disableDrag: disableDrag, // 👈
    builder: (context, LatLng latLng, isDragging) {
      return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () => mapStateNotifier.sendUiEvent(element.tapEvent()),
            child: element.buildMarker(isDragging: isDragging),
          ),
        ],
      );
    },
    onDragStart: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragStartEvent(latLng)),
    onDragEnd: (_, LatLng latLng) =>
        mapStateNotifier.sendUiEvent(element.dragEndEvent(latLng)),
  );
}
