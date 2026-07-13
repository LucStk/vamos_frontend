import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';

import '/application/transition_result.dart';

TransitionResult reduceSketch(MapState state, MapInputEvent event) {
  final mode = state.mode;
  if (mode is! SketchMode) return TransitionResult(nextState: state);

  return switch (event) {
    PencilDragUpdate e => TransitionResult(
      nextState: state.copyWith(
        mode: mode.copyWith(itineraire: [...mode.itineraire, e.latLng]),
      ),
    ),
    _ => TransitionResult(nextState: state),
  };
}
