import 'package:map_application/application/map_state.dart';
import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapState state, MapInputEvent event) {
  return switch (event) {
    MapTapped e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.cursorDrawn(latLng: e.latLng)),
    ),
    _ => TransitionResult(nextState: state),
  };
}
