import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapMode state, MapIntents intent) {
  return switch (intent) {
    PutCursor cmd => TransitionResult(
      nextState: MapMode.cursorDrawn(latLng: cmd.latLng),
    ),
    SelectVertex cmd => TransitionResult(
      nextState: MapMode.vertexSelected(vertexId: cmd.vertexId),
    ),
    SelectSegment cmd => TransitionResult(
      nextState: MapMode.segmentSelected(segmentId: cmd.segmentId),
    ),
    SelectWaypoint cmd => TransitionResult(
      nextState: MapMode.waypointSelected(waypointId: cmd.waypointId),
    ),
    _ => TransitionResult(nextState: state),
  };
}
