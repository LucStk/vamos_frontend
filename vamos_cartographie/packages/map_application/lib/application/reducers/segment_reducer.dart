import '/map_application.dart';

TransitionResult reduceSegment(MapMode state, MapEvent event) {
  return switch (state) {
    _ => TransitionResult(nextState: state),
  };
}
