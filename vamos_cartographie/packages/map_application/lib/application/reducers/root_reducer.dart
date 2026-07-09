import 'package:map_application/application/reducers/waypoint_reducer.dart';
import 'package:map_application/map_application.dart';
import "cursor_reducer.dart";

TransitionResult reduce(MapState state, MapInputEvent event) {
  return switch (state.mode) {
    Idle _ => reduceIdle(state, event),
    CursorDrawn _ => reduceCursor(state, event),
    WaypointSelected _ => reduceWaypoint(state, event),
    _ => TransitionResult(nextState: state),
  };
}
