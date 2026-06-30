import 'package:map_application/effects/map_effect.dart';

import '/intents/intents.dart';
import '/application/transition_result.dart';

import '/domain/domain.dart';

TransitionResult reduceCursor(MapMode state, MapIntents intent) {
  return switch (intent) {
    CreateWaypointVertex _ => TransitionResult(nextState: MapMode.idle()),
    PutCursor e => TransitionResult(
      nextState: MapMode.cursorDrawn(latLng: e.latLng),
    ),
    CreateSimpleVertex e => TransitionResult(
      nextState: MapMode.idle(),
      effects: [CreateSimpleVertexEffect(position: e.position)],
    ),
    _ => TransitionResult(nextState: state),
  };
}
