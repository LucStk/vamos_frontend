part of "marker_ui_element.dart";

class WaypointUiElement extends VertexUiElement {
  final Waypoint waypoint;

  const WaypointUiElement(super.tripId, super.vertex, this.waypoint);

  @override
  Widget buildMarker({bool isDragging = false}) {
    return WaypointMarker(tripId: tripId, waypointId: waypoint.id);
  }

  @override
  MapUiEvent tapEvent() => WaypointTapped(waypoint.id);
  @override
  MapUiEvent doubleTapEvent() => WaypointDoubleTapped(waypoint.id);
  @override
  MapUiEvent dragStartEvent(_) => WaypointDragStarted(waypoint.id);
  @override
  MapUiEvent dragEndEvent(_) => WaypointDragEnded(waypoint.id);
}
