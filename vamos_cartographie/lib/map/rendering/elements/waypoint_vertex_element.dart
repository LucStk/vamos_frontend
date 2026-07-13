import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import '/map/rendering/elements/vertex_element.dart';
import '/map/rendering/widgets/widgets.dart';

import 'package:trip_application/trip_application.dart';

class WaypointElement extends VertexElement {
  final Waypoint waypoint;

  const WaypointElement(super.trip, super.vertex, this.waypoint);

  @override
  Widget buildMarker({bool isDragging = false}) {
    return WaypointMarker(
      tripId: tripId,
      vertexRef: vertexUi.ref,
      waypoint: waypoint,
      isDragging: isDragging,
    );
  }

  @override
  MapInputEvent tapEvent() => WaypointTapped(waypoint.id, vertexUi.ref);
  @override
  MapInputEvent doubleTapEvent() =>
      WaypointDoubleTapped(waypoint.id, vertexUi.ref);
  @override
  MapInputEvent dragStartEvent(_) =>
      WaypointDragStarted(waypoint.id, vertexUi.ref);
  @override
  MapInputEvent dragEndEvent(LatLng latLng) =>
      WaypointDragEnded(waypoint.id, super.vertexUi.ref, latLng);
  @override
  MapInputEvent dragUpdateEvent(LatLng latLng) => WaypointDragUpdate(latLng);
}
