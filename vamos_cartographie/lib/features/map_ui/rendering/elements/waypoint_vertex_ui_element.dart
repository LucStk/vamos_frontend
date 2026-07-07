import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex_ui_element.dart';
import 'package:vamos_cartographie/features/waypoint/domain/ext_waypoint_poi.dart';

class WaypointUiElement extends VertexUiElement {
  final Waypoint waypoint;

  const WaypointUiElement(super.trip, super.vertex, this.waypoint);

  @override
  Widget buildMarker({bool isDragging = false}) {
    return CircleAvatar(
      radius: 16, // Taille globale du cercle (diamètre = 32)
      backgroundColor: Color(
        waypoint.poiCategoryUi.colorValue,
      ), // <-- La couleur de votre fond rond
      child: Icon(waypoint.poiCategoryUi.icon, color: Colors.white, size: 20),
    );
  }

  @override
  MapInputEvent tapEvent() => WaypointTapped(waypoint.id);
  @override
  MapInputEvent doubleTapEvent() => WaypointDoubleTapped(waypoint.id);
  @override
  MapInputEvent dragStartEvent(_) => WaypointDragStarted(waypoint.id);
  @override
  MapInputEvent dragEndEvent(LatLng latLng) =>
      WaypointDragEnded(super.vertexUi.ref, latLng);
}
