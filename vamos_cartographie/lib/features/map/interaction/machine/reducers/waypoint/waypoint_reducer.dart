import 'package:vamos_cartographie/features/map/interaction/commands/commands.dart';
import 'package:vamos_cartographie/features/map/interaction/machine/map_mode.dart';
import 'package:vamos_cartographie/features/map/interaction/machine/transition_result.dart';

TransitionResult reduceWaypoint(MapMode state, MapCommand command) {
  return switch (state) {
    WaypointSelected s => _reduceWaypointSelected(s, command),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult _reduceWaypointSelected(
  WaypointSelected state,
  MapCommand command,
) {
  // Handle waypoint selected state
  return TransitionResult(nextState: state);
}
