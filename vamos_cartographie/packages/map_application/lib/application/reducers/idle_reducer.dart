import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapState state, MapInputEvent event) {
  return switch (event) {
    MapTapped e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.cursorDrawn(latLng: e.latLng)),
    ),
    VertexDragEnd e => TransitionResult(
      nextState: state.copyWith(mode: Idle()),
      intents: [UpdateVertexPosition(e.vertexRef, e.latLng)],
    ),
    WaypointDragEnded e => TransitionResult(
      nextState: state.copyWith(mode: Idle()),
      intents: [UpdateVertexPosition(e.vertexRef, e.latLng)],
    ),
    VertexTapped e => TransitionResult(
      nextState: state,
      intents: [CreateWaypointFromVertex(e.vertexRef)],
    ),
    WaypointTapped e => TransitionResult(
      nextState: state.copyWith(
        overlay: MapOverlayState.viewWaypointDialog(waypointId: e.waypointId),
      ),
    ),
    _ => TransitionResult(nextState: state),
  };
}
