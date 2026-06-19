library ui_events;

import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/domain.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
part "vertex_ui_event.dart";
part "waypoint_ui_event.dart";
part "cursor_ui_event.dart";
part "segment_ui_event.dart";

//Ici on capture exactement ce que Flutter observe.
sealed class MapUiEvent {
  const MapUiEvent();
}

class MapTapped extends MapUiEvent {
  final LatLng latLng;
  const MapTapped(this.latLng);
}
