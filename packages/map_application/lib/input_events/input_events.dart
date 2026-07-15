import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/topology.dart';
part "vertex_events.dart";
part "cursor_events.dart";
part "segment_events.dart";
part "idle_events.dart";
part "pencil_events.dart";

//Ici on capture exactement ce que Flutter observe.
sealed class MapInputEvent {
  const MapInputEvent();
}
