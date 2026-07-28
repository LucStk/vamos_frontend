import 'package:latlong2/latlong.dart';
import 'package:trip_application/topology/topology.dart';
import 'package:trip_application/waypoint/domain/waypoint_model.dart';

part "segment_events/segment_input_events.dart";
part "segment_events/segment_output_events.dart";

part "waypoint_events/waypoint_output_events.dart";
part "cursor_input_events.dart";
part "vertex_input_events.dart";
part "sketch_input_events.dart";

sealed class MapEvent {
  const MapEvent();
}

sealed class MapInputEvent extends MapEvent {
  const MapInputEvent();
}

sealed class MapOutputEvent extends MapEvent {
  const MapOutputEvent();
}

class MapTapped extends MapEvent {
  final LatLng latLng;
  const MapTapped(this.latLng);
}

// class ShowError extends MapEvent {
//   final String message;
//   const ShowError(this.message);
// }
