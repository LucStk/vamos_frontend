import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/interaction/ui_events/ui_events.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/elements/vertex/vertex_marker.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/elements/vertex/waypoint_marker.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

part "topology_ui_element.dart";
part "vertex_ui_element.dart";
part "waypoint_vertex_ui_element.dart";
part "cursor_ui_element.dart";
part "marker_ui_element.dart";

sealed class MapUiElement {
  const MapUiElement();
}
