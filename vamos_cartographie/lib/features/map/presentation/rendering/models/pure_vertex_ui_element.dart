part of "map_ui_element.dart";

class PureVertexUiModel extends VertexUiModel {
  const PureVertexUiModel(super.vertex);

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
