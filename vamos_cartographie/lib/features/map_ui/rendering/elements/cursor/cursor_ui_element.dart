import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map_editor/events/ui/ui_events.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/drag_marker_ui_element.dart';
import "cursor_marker.dart";

class CursorUiElement extends DragMarkerUiElement {
  @override
  final LatLng latLng;
  const CursorUiElement(super.tripId, this.latLng);

  @override
  Widget buildMarker({bool isDragging = false}) =>
      CursorMarker(isDragging: isDragging);

  @override
  MapUiEvent tapEvent() => CursorTapped(latLng);
  @override
  MapUiEvent doubleTapEvent() => CursorDoubleTapped(latLng);
  @override
  MapUiEvent dragStartEvent(LatLng latLng) => CursorDraggedStart();
  @override
  MapUiEvent dragEndEvent(LatLng latLng) => CursorDraggedEnd(latLng);
}
