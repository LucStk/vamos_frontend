part of "map_ui_element.dart";

sealed class VertexUiModel extends TopologyUiElement {
  final Vertex vertex;

  const VertexUiModel(this.vertex);

  Id<Vertex> get id => vertex.id;
  LatLng get latLng => vertex.latLng;

  Widget buildMarker(Id<Trip> tripId, bool isDragging);

  MapUiEvent tapEvent();
  MapUiEvent doubleTapEvent();
  MapUiEvent dragStartEvent();
  MapUiEvent dragEndEvent();
}
