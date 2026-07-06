import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapMode state, MapEvent event) {
  return switch (event) {
    MapTapped e => TransitionResult(
      nextState: MapMode.cursorDrawn(latLng: e.latLng),
    ),
    _ => TransitionResult(nextState: state),
  };
}
