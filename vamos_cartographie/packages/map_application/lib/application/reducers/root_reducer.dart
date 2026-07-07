import 'package:map_application/map_application.dart';
import "cursor_reducer.dart";

TransitionResult reduce(MapState state, MapInputEvent event) {
  return switch (state.mode) {
    Idle _ => reduceIdle(state, event),
    CursorDrawn _ => reduceCursor(state, event),
    _ => TransitionResult(nextState: state),
  };
}
