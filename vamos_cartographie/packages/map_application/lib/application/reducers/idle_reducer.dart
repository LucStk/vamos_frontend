import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapMode state, MapEvent event) {
  return switch (event) {
    MapTapped e => TransitionResult(
      nextState: MapMode.cursorDrawn(latLng: e.latLng),
    ),
    VertexDragStarted e => TransitionResult(
      nextState: MapMode.draggingVertex(vertexRef: e.vertexRef),
    ),
    VertexTapped e => TransitionResult(
      nextState: state,
      intents: [CreateWaypointFromVertex(e.vertexRef)],
    ),
    _ => TransitionResult(nextState: state),
  };
}
