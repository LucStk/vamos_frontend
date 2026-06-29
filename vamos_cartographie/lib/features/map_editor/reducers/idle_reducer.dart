import '/features/map_editor/intents/intents.dart';
import 'package:vamos_cartographie/features/map_editor/application/transition_result.dart';

import '/features/map_editor/domain/domain.dart';

TransitionResult reduceIdle(MapMode state, MapIntents intent) {
  return switch (intent) {
    SelectVertex cmd => TransitionResult(
      nextState: MapMode.vertexSelected(vertexId: cmd.vertexId),
    ),
    SelectSegment cmd => TransitionResult(
      nextState: MapMode.segmentSelected(segmentId: cmd.segmentId),
    ),
    SelectWaypoint cmd => TransitionResult(
      nextState: MapMode.waypointSelected(waypointId: cmd.waypointId),
    ),
    _ => TransitionResult(nextState: state),
  };
}
