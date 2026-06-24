import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/cursor/cursor_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/vertex_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/waypoint_vertex_ui_element.dart';

Widget buildPopup(Id<Trip> tripId) {
  return switch (this) {
    WaypointUiElement w => Row(children: []),
    VertexUiElement v => Row(children: []),
    CursorUiElement c => Row(children: []),
  };
}
