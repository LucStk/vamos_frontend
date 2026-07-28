import 'package:map_application/reducers/idle/cursor_event_reducer.dart';
import 'package:map_application/reducers/idle/segment_event_reducer.dart';
import 'package:map_application/reducers/idle/vertex_event_reducer.dart';
import '/domain/domain.dart';
import "/events/events.dart";

TransitionResult reduceIdle(MapState state, MapEvent event) {
  return switch (event) {
    MapTapped e => TransitionResult(
      nextState: state.copyWith(
        selection: MapSelection.cursor(latLng: e.latLng),
      ),
    ),
    CursorInputEvent e => reduceCursorInputEvents(state, e),
    SegmentInputEvent e => reduceSegmentInputEvents(state, e),
    SegmentOutputEvent e => reduceSegmentOutputEvents(state, e),
    VertexInputEvent e => reduceVertexEvent(state, e),
    _ => TransitionResult(nextState: state),
  };
}
