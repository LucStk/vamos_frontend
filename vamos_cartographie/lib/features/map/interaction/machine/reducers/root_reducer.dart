import 'package:vamos_cartographie/features/map/interaction/commands/commands.dart';
import 'package:vamos_cartographie/features/map/interaction/machine/map_mode.dart';
import 'package:vamos_cartographie/features/map/interaction/machine/transition_result.dart';
import 'idle_reducer.dart';
import 'vertex/vertex_reducer.dart';
import 'segment/segment_reducer.dart';
import 'waypoint/waypoint_reducer.dart';

TransitionResult reduce(MapMode state, MapCommand command) {
  return switch (state) {
    Idle() => reduceIdle(state, command),
    CursorDrawn() => TransitionResult(nextState: state),

    VertexSelected s => reduceVertex(s, command),
    DraggingVertex s => reduceVertex(s, command),

    SegmentSelected s => reduceSegment(s, command),
    CreatingSegment s => reduceSegment(s, command),
    SplittingSegment s => reduceSegment(s, command),

    WaypointSelected s => reduceWaypoint(s, command),
  };
}
