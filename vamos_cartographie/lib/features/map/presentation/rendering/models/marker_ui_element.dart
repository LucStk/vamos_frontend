part of "map_ui_element.dart";

sealed class MarkerUiElement extends MapUiElement {
  const MarkerUiElement();
  LatLng get latLng;

  Widget buildMarker(Id<Trip> tripId, bool isDragging);
  MapUiEvent tapEvent();
  MapUiEvent doubleTapEvent();
  MapUiEvent dragStartEvent();
  MapUiEvent dragEndEvent();
}
