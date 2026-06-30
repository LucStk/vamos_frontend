import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/events/ui_events.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/drag_marker_ui_element.dart';

class CursorUiElement extends DragMarkerUiElement {
  @override
  final LatLng latLng;
  const CursorUiElement(super.tripId, this.latLng);

  @override
  Widget buildMarker({bool isDragging = false}) =>
      Icon(Icons.place_sharp, size: 30, color: Colors.black);

  @override
  MapUiEvent tapEvent() => CursorTapped(latLng);
  @override
  MapUiEvent doubleTapEvent() => CursorDoubleTapped(latLng);
  @override
  MapUiEvent dragStartEvent(LatLng latLng) => CursorDraggedStart();
  @override
  MapUiEvent dragEndEvent(LatLng latLng) => CursorDraggedEnd(latLng);
}
