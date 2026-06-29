import '/features/map_editor/intents/intents.dart';
import 'package:vamos_cartographie/features/map_editor/application/transition_result.dart';

import '/features/map_editor/domain/domain.dart';

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
