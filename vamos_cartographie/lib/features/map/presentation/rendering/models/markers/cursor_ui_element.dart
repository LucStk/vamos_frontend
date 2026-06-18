part of "marker_ui_element.dart";

class CursorUiElement extends DragMarkerUiElement with HasPopUp {
  @override
  final LatLng latLng;

  const CursorUiElement(super.tripId, this.latLng);
  @override
  Widget get popup => CursorPopUp(tripId: tripId, latLng: latLng);

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
