part of "map_ui_element.dart";

sealed class DragMarkerUiElement extends MapUiElement {
  const DragMarkerUiElement();
  LatLng get latLng;

  Widget buildMarker(Id<Trip> tripId, bool isDragging);

  MapUiEvent tapEvent();
  MapUiEvent doubleTapEvent();
  MapUiEvent dragStartEvent(LatLng latng);
  MapUiEvent dragEndEvent(LatLng latlng);
}
