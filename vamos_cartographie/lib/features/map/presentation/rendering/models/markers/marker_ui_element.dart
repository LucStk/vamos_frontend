import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/application/events/ui_events.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/elements/cursor/cursor_marker.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/elements/vertex/vertex_marker.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/elements/vertex/waypoint_marker.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
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
