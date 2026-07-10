import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';

import '/application/transition_result.dart';

TransitionResult reduceCursor(MapState state, MapInputEvent event) {
  return switch (event) {
    CursorTapped _ => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
    ),
    MapTapped e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.cursorDrawn(latLng: e.latLng)),
    ),

    _ => TransitionResult(nextState: state),
  };
}
