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

    _ => TransitionResult(nextState: state),
  };
}
