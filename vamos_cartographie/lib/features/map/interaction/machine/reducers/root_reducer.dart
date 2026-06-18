import 'package:vamos_cartographie/features/map/interaction/commands/map_command.dart';

import 'vertex/vertex_reducer.dart';
import 'segment/segment_reducer.dart';
import 'waypoint/waypoint_reducer.dart';

TransitionResult reduce(MapMode state, MapCommand command) {
  return switch (state) {
    Idle() => reduceIdle(state, intent),

    VertexSelected s => reduceVertex(s, intent),
    DraggingVertex s => reduceVertex(s, intent),

    SegmentSelected s => reduceSegment(s, intent),
    CreatingSegment s => reduceSegment(s, intent),
    SplittingSegment s => reduceSegment(s, intent),

    WaypointSelected s => reduceWaypoint(s, intent),
  };
}
