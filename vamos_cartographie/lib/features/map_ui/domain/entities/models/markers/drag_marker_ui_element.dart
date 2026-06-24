part of "marker_ui_element.dart";

abstract class DragMarkerUiElement extends MarkerUiElement {
  const DragMarkerUiElement(super.tripId);

  @override
  Widget buildMarker({bool isDragging = false});

  MapUiEvent dragStartEvent(LatLng latng);
  MapUiEvent dragEndEvent(LatLng latlng);
}
