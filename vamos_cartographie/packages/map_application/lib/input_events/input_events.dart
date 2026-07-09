import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/domain/types/segment_ref.dart';
import 'package:trip_application/topology/domain/types/vertex_ref.dart';
import 'package:trip_application/waypoint/domain/waypoint.dart';
part "vertex_events.dart";
part "waypoint_events.dart";
part "cursor_events.dart";
part "segment_events.dart";
part "idle_events.dart";

//Ici on capture exactement ce que Flutter observe.
sealed class MapInputEvent {
  const MapInputEvent();
}
