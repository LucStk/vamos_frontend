import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/drag_marker_ui_element.dart';

import 'package:map_application/map_application.dart';

class CursorUiElement extends DragMarkerUiElement {
  @override
  final LatLng latLng;
  const CursorUiElement(super.tripId, this.latLng);

  @override
  Widget buildMarker({bool isDragging = false}) =>
      Icon(Icons.place_sharp, size: 30, color: Colors.black);

  @override
  MapInputEvent tapEvent() => CursorTapped(latLng);
  @override
  MapInputEvent doubleTapEvent() => CursorDoubleTapped(latLng);
  @override
  MapInputEvent dragStartEvent(LatLng latLng) => CursorDraggedStart();
  @override
  MapInputEvent dragEndEvent(LatLng latLng) => CursorDraggedEnd(latLng);
}
