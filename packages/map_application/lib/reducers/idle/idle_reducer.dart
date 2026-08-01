import 'package:map_application/reducers/idle/sketch_reducer.dart';

import 'package:map_application/map_editor.dart';
import 'cursor_event_reducer.dart';
import 'segment_event_reducer.dart';
import 'vertex_event_reducer.dart';
import 'waypoint_event_reducer.dart';
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
    SketchInputEvent e => reduceSketchInputEvents(state, e),

    WaypointOutputEvent e => reduceWaypointOuputEvents(state, e),
  };
}
