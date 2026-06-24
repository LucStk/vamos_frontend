import 'package:flutter/cupertino.dart';
import 'package:trip_domain/domain/entities/waypoint.dart';
import 'package:vamos_cartographie/features/map_editor/events/ui/ui_events.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/vertex_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/waypoint_marker.dart';
import 'package:vamos_cartographie/features/waypoint/domain/waypoint_ui.dart';

class WaypointUiElement extends VertexUiElement {
  final WaypointUi waypointUi;

  const WaypointUiElement(super.trip, super.vertex, this.waypointUi);

  @override
  Widget buildMarker({bool isDragging = false}) {
    return WaypointMarker(waypointId: waypointUi.id);
  }

  @override
  MapUiEvent tapEvent() => WaypointTapped(waypointUi.id);
  @override
  MapUiEvent doubleTapEvent() => WaypointDoubleTapped(waypointUi.id);
  @override
  MapUiEvent dragStartEvent(_) => WaypointDragStarted(waypointUi.id);
  @override
  MapUiEvent dragEndEvent(_) => WaypointDragEnded(waypointUi.id);
}
