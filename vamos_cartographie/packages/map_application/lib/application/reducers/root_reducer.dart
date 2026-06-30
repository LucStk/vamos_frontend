import 'package:map_application/map_application.dart';
import "cursor_reducer.dart";

TransitionResult reduce(MapMode state, MapIntents intent) {
  return switch (state) {
    Idle() => reduceIdle(state, intent),
    CursorDrawn() => reduceCursor(state, intent),

    VertexSelected s => reduceVertex(s, intent),
    DraggingVertex s => reduceVertex(s, intent),
    SegmentSelected s => reduceSegment(s, intent),
    CreatingSegment s => reduceSegment(s, intent),
    SplittingSegment s => reduceSegment(s, intent),

    WaypointSelected s => reduceWaypoint(s, intent),
  };
}
