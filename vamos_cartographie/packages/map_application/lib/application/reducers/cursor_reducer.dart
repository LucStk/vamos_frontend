import 'package:map_application/input_events/input_events.dart';

import '/intents/intents.dart';
import '/application/transition_result.dart';

import '/domain/domain.dart';

TransitionResult reduceCursor(MapState state, MapInputEvent event) {
  return switch (event) {
    CursorTapped e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
      intents: [CreateSimpleVertex(e.latLng)],
    ),
    MapTapped e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.cursorDrawn(latLng: e.latLng)),
    ),
    WaypointTapped e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.waypointSelected(waypointId: e.waypointId),
      ),
    ),
    VertexDragStarted _ => TransitionResult(
      nextState: state.copyWith(mode: Idle()),
    ),
    WaypointDragStarted _ => TransitionResult(
      nextState: state.copyWith(mode: Idle()),
    ),
    _ => TransitionResult(nextState: state),
  };
}
