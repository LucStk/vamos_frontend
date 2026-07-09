import 'package:map_application/input_events/input_events.dart';

import '/application/transition_result.dart';

import '/domain/domain.dart';

TransitionResult reduceWaypoint(MapState state, MapInputEvent event) {
  return switch (event) {
    WaypointTapped e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.waypointSelected(waypointId: e.waypointId),
      ),
    ),
    MapTapped _ => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
    ),
    _ => TransitionResult(nextState: state),
  };
}
