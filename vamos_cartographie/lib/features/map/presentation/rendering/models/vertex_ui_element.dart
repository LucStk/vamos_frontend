part of "map_ui_element.dart";

sealed class VertexUiModel extends MarkerUiElement {
  final Vertex vertex;

  const VertexUiModel(this.vertex);

  Id<Vertex> get id => vertex.id;

  @override
  LatLng get latLng => vertex.latLng;

  @override
  Widget buildMarker(Id<Trip> tripId, bool isDragging) {
    return VertexMarker(tripId: tripId, vertexId: id, isDragging: isDragging);
  }

  @override
  MapUiEvent tapEvent() {
    return VertexTapped(id);
  }

  @override
  MapUiEvent doubleTapEvent() => VertexDoubleTapped(vertex.id);
  @override
  MapUiEvent dragStartEvent() => VertexDragStarted(vertex.id);
  @override
  MapUiEvent dragEndEvent() => VertexDragEndend(vertex.id);
}
