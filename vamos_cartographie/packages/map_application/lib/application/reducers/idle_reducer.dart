import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapState state, MapInputEvent event) {
  return switch (event) {
    _ => TransitionResult(nextState: state),
  };
}
