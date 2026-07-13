import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:vamos_cartographie/map/rendering/rendering.dart';

import 'package:trip_application/trip_application.dart';

enum ConnectionHandleType { incoming, outgoing }

class VertexElement extends DragMarkerElement {
  final VertexUiModel vertexUi;
  const VertexElement(super.trip, this.vertexUi);

  @override
  LatLng get latLng => vertexUi.position;

  @override
  Widget buildMarker({bool isDragging = false}) {
    return VertexMarker(
      tripId: tripId,
      vertexRef: vertexUi.ref,
      isDragging: isDragging,
    );
  }

  MapInputEvent connectionDragStartEvent(
    ConnectionHandleType type,
    Offset offset,
  ) => ConnectionDragStart(vertexUi.ref);

  MapInputEvent connectionDragUpdateEvent(
    ConnectionHandleType type,
    Offset offset,
  ) => ConnectionDragUpdate(vertexUi.ref);

  MapInputEvent connectionDragEndEvent(ConnectionHandleType type) =>
      ConnectionDragEnd(vertexUi.ref);

  @override
  MapInputEvent tapEvent() => VertexTapped(vertexUi.ref);
  @override
  MapInputEvent doubleTapEvent() => VertexDoubleTapped(vertexUi.ref);
  @override
  MapInputEvent dragStartEvent(_) => VertexDragStarted(vertexUi.ref);
  @override
  MapInputEvent dragEndEvent(LatLng latLng) =>
      VertexDragEnd(vertexUi.ref, latLng);
  @override
  MapInputEvent dragUpdateEvent(LatLng latLng) => VertexDragUpdate(latLng);
}
