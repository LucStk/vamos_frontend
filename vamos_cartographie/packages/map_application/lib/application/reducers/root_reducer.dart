import 'package:map_application/map_application.dart';
import "cursor_reducer.dart";

TransitionResult reduce(MapMode state, MapEvent event) {
  return switch (state) {
    Idle() => reduceIdle(state, event),
    CursorDrawn() => reduceCursor(state, event),

    VertexSelected s => reduceVertex(s, event),
    DraggingVertex s => reduceVertex(s, event),
    SegmentSelected s => reduceSegment(s, event),
    CreatingSegment s => reduceSegment(s, event),
    SplittingSegment s => reduceSegment(s, event),

    WaypointSelected s => reduceWaypoint(s, event),
  };
}
