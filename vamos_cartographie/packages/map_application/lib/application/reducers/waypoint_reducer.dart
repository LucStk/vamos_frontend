import 'package:map_application/map_application.dart';

TransitionResult reduceWaypoint(MapMode state, MapEvent event) {
  return switch (state) {
    _ => TransitionResult(nextState: state),
  };
}
