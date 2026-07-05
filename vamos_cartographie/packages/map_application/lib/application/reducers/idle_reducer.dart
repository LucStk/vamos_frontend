import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapMode state, MapIntents intent) {
  return switch (intent) {
    PutCursor cmd => TransitionResult(
      nextState: MapMode.cursorDrawn(latLng: cmd.latLng),
    ),
    SelectVertex cmd => TransitionResult(
      nextState: MapMode.vertexSelected(vertexRef: cmd.vertexRef),
    ),
    SelectSegment cmd => TransitionResult(
      nextState: MapMode.segmentSelected(segmentRef: cmd.segmentRef),
    ),
    SelectWaypoint cmd => TransitionResult(
      nextState: MapMode.waypointSelected(waypointId: cmd.waypointId),
    ),
    _ => TransitionResult(nextState: state),
  };
}
