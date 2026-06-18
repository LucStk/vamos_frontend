part of "marker_ui_element.dart";

abstract class DragMarkerUiElement extends MarkerUiElement {
  const DragMarkerUiElement();

  @override
  Widget buildMarker(Id<Trip> tripId, {bool isDragging = false});

  MapUiEvent dragStartEvent(LatLng latng);
  MapUiEvent dragEndEvent(LatLng latlng);
}
