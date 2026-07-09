import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/widgets/widgets.dart';
import 'package:vamos_cartographie/features/waypoint/domain/ext_waypoint_poi.dart';

class WaypointUiElement extends VertexUiElement {
  final Waypoint waypoint;

  const WaypointUiElement(super.trip, super.vertex, this.waypoint);

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
}
