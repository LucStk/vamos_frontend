import 'package:latlong2/latlong.dart';
import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';

import '/application/transition_result.dart';

TransitionResult reduceCursor(
  MapState state,
  MapInputEvent event,
  LatLng latlng,
) {
  return switch (event) {
    _ => TransitionResult(nextState: state),
  };
}
