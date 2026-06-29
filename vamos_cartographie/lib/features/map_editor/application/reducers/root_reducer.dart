import '/features/map_editor/intents/intents.dart';
import 'package:vamos_cartographie/features/map_editor/application/transition_result.dart';
import 'idle_reducer.dart';
import 'vertex_reducer.dart';
import 'segment_reducer.dart';
import 'waypoint_reducer.dart';

import '/features/map_editor/domain/domain.dart';

TransitionResult reduce(MapMode state, MapIntents intent) {
  return switch (state) {
    Idle() => reduceIdle(state, intent),
    CursorDrawn() => TransitionResult(nextState: state),

    VertexSelected s => reduceVertex(s, intent),
    DraggingVertex s => reduceVertex(s, intent),
    SegmentSelected s => reduceSegment(s, intent),
    CreatingSegment s => reduceSegment(s, intent),
    SplittingSegment s => reduceSegment(s, intent),

    WaypointSelected s => reduceWaypoint(s, intent),
  };
}
