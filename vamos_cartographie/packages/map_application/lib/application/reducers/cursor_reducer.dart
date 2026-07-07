import 'package:map_application/events/events.dart';

import '/intents/intents.dart';
import '/application/transition_result.dart';

import '/domain/domain.dart';

TransitionResult reduceCursor(MapState state, MapEvent event) {
  return switch (event) {
    CursorTapped e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
      intents: [CreateSimpleVertex(e.latLng)],
    ),

    _ => TransitionResult(nextState: state),
  };
}
