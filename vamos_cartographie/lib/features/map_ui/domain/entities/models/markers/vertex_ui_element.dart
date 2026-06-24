part of "marker_ui_element.dart";

class VertexUiElement extends DragMarkerUiElement {
  final Vertex vertex;

  const VertexUiElement(super.tripId, this.vertex);

  Id<Vertex> get id => vertex.id;

  @override
  LatLng get latLng => vertex.latLng;

  @override
  Widget buildMarker({bool isDragging = false}) =>
      VertexMarker(tripId: tripId, vertexId: id, isDragging: isDragging);
  @override
  MapUiEvent tapEvent() => VertexTapped(id);
  @override
  MapUiEvent doubleTapEvent() => VertexDoubleTapped(vertex.id);
  @override
  MapUiEvent dragStartEvent(_) => VertexDragStarted(vertex.id);
  @override
  MapUiEvent dragEndEvent(_) => VertexDragEndend(vertex.id);
}
