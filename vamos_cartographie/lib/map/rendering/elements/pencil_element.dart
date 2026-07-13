import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '/map/rendering/elements/drag_marker_element.dart';

import 'package:map_application/map_application.dart';

class PencilElement extends DragMarkerElement {
  @override
  final LatLng latLng;
  const PencilElement(super.tripId, this.latLng);

  @override
  Widget buildMarker({bool isDragging = false}) =>
      Icon(Icons.draw_sharp, size: 30, color: Colors.black);

  @override
  MapInputEvent tapEvent() => PencilTapped(latLng);
  @override
  MapInputEvent doubleTapEvent() => PencilDoubleTapped(latLng);
  @override
  MapInputEvent dragStartEvent(LatLng latLng) => PencilDraggedStart();
  @override
  MapInputEvent dragEndEvent(LatLng latLng) => PencilDraggedEnd(latLng);
  @override
  MapInputEvent dragUpdateEvent(LatLng latLng) => PencilDragUpdate(latLng);
}
