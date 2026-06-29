import 'package:map_application/map_application.dart';

TransitionResult reduceWaypoint(MapMode state, MapIntents intent) {
  return switch (state) {
    WaypointSelected s => _reduceWaypointSelected(s, intent),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult _reduceWaypointSelected(
  WaypointSelected state,
  MapIntents intent,
) {
  // Handle waypoint selected state
  return TransitionResult(nextState: state);
}
