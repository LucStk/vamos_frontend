import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/events/events.dart';
import 'package:trip_domain/domain/entities/vertex/vertex_ui_model.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/drag_marker_ui_element.dart';

class VertexUiElement extends DragMarkerUiElement {
  final VertexUiModel vertexUi;
  const VertexUiElement(super.trip, this.vertexUi);

  @override
  LatLng get latLng => vertexUi.position;

  @override
  Widget buildMarker({bool isDragging = false}) {
    return Icon(Icons.circle, size: 20, color: Colors.black);
  }

  @override
  MapEvent tapEvent() => VertexTapped(vertexUi.ref);
  @override
  MapEvent doubleTapEvent() => VertexDoubleTapped(vertexUi.ref);
  @override
  MapEvent dragStartEvent(_) => VertexDragStarted(vertexUi.ref);
  @override
  MapEvent dragEndEvent(LatLng latLng) => VertexDragEnd(vertexUi.ref, latLng);
}
