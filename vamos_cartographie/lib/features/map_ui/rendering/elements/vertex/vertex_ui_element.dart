import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/events/ui_events.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/drag_marker_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/vertex_marker.dart';
import 'package:vamos_cartographie/features/topology/vertex_ui.dart';

class VertexUiElement extends DragMarkerUiElement {
  final VertexUi vertex;

  const VertexUiElement(super.trip, this.vertex);

  VertexUiId get id => vertex.id;

  @override
  LatLng get latLng => vertex.position;

  @override
  Widget buildMarker({bool isDragging = false}) =>
      VertexMarker(vertexUiId: id, isDragging: isDragging);
  @override
  MapUiEvent tapEvent() => VertexTapped(id);
  @override
  MapUiEvent doubleTapEvent() => VertexDoubleTapped(vertex.id);
  @override
  MapUiEvent dragStartEvent(_) => VertexDragStarted(vertex.id);
  @override
  MapUiEvent dragEndEvent(_) => VertexDragEndend(vertex.id);
}
