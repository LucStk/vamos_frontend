part of "marker_ui_element.dart";

class CursorUiElement extends DragMarkerUiElement {
  @override
  final LatLng latLng;

  const CursorUiElement(this.latLng);

  @override
  Widget buildMarker(Id<Trip> tripId, {bool isDragging = false}) =>
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
