import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';

import '/application/transition_result.dart';

TransitionResult reduceDrawingSegment(MapState state, MapInputEvent event) {
  return switch (event) {
    _ => TransitionResult(nextState: state),
  };
}
