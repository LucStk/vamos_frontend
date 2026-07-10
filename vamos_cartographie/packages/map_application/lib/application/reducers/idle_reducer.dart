import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapState state, MapInputEvent event) {
  return switch (event) {
    MapTapped e => TransitionResult(
      nextState: state.copyWith(
        selection: MapSelection.cursor(),
        mode: MapMode.cursorDrawn(latLng: e.latLng),
      ),
    ),
    _ => TransitionResult(nextState: state),
  };
}
