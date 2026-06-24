import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_editor/events/ui/ui_events.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/cursor/cursor_marker.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/vertex_marker.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/waypoint_marker.dart';
import '../map_ui_element.dart';

part "vertex_ui_element.dart";
part "waypoint_vertex_ui_element.dart";
part "cursor_ui_element.dart";
part "drag_marker_ui_element.dart";
part "seg_marker_ui_element.dart";

abstract class MarkerUiElement extends MapUiElement {
  const MarkerUiElement(super.tripId);
  LatLng get latLng;

  Widget buildMarker({bool isDragging = false});

  MapUiEvent tapEvent();
  MapUiEvent doubleTapEvent();
}
