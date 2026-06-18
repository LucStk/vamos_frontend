part of "map_ui_element.dart";

class WaypointVertexUiModel extends VertexUiModel {
  final Waypoint waypoint;

  const WaypointVertexUiModel(super.vertex, this.waypoint);

  @override
  Widget buildMarker(Id<Trip> tripId, bool isDragging) {
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
