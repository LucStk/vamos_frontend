import 'package:vamos_cartographie/features/map/application/commands/commands.dart';
import 'package:vamos_cartographie/features/map/domain/state/map_mode.dart';
import 'package:vamos_cartographie/features/map/application/handlers/transition_result.dart';

TransitionResult reduceIdle(MapMode state, MapCommand command) {
  return switch (command) {
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
