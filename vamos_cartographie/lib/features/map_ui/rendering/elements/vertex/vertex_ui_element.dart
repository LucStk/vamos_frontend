part of "marker_ui_element.dart";

class VertexUiElement extends DragMarkerUiElement {
  final VertexUi vertex;

  const VertexUiElement(super.tripId, this.vertex);

  VertexUiId get id => vertex.id;

  @override
  LatLng get latLng => vertex.position;

  @override
  Widget buildMarker({bool isDragging = false}) =>
      VertexMarker(tripId: super.tripId, vertexId: id, isDragging: isDragging);
  @override
  MapUiEvent tapEvent() => VertexTapped(id);
  @override
  MapUiEvent doubleTapEvent() => VertexDoubleTapped(vertex.id);
  @override
  MapUiEvent dragStartEvent(_) => VertexDragStarted(vertex.id);
  @override
  MapUiEvent dragEndEvent(_) => VertexDragEndend(vertex.id);
}
