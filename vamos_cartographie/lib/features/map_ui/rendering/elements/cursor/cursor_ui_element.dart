part of "marker_ui_element.dart";

class CursorMarkerElement extends DragMarkerUiElement {
  @override
  final LatLng latLng;

  const CursorMarkerElement(super.tripId, this.latLng);

  @override
  Widget buildMarker({bool isDragging = false}) =>
      CursorMarker(tripId: tripId, isDragging: isDragging);
  @override
  MapUiEvent tapEvent() => CursorTapped(latLng);
  @override
  MapUiEvent doubleTapEvent() => CursorDoubleTapped(latLng);
  @override
  MapUiEvent dragStartEvent(LatLng latLng) => CursorDraggedStart();
  @override
  MapUiEvent dragEndEvent(LatLng latLng) => CursorDraggedEnd(latLng);
}
