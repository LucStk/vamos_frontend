import 'package:map_application/map_application.dart';
import "cursor_reducer.dart";
import "idle_reducer.dart";

TransitionResult reduce(MapState state, MapInputEvent event) {
  // Les events de sélection sont orthogonaux au mode process.
  final selectionResult = reduceSelection(state, event);
  if (selectionResult != null) return selectionResult;

  return switch (state.mode) {
    Idle _ => reduceIdle(state, event),
    CursorDrawn _ => reduceCursor(state, event),
    // DraggingVertex _ => reduceDraggingVertex(state, event),
    // CreatingSegment _ => reduceCreatingSegment(state, event),
    // SplittingSegment _ => reduceSplittingSegment(state, event),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult? reduceSelection(MapState state, MapInputEvent event) {
  return switch (event) {
    VertexTapped e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.vertex(vertexRef: e.vertexRef),
      ),
    ),
    WaypointTapped e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.waypoint(
          waypointId: e.waypointId,
          vertexRef: e.vertexRef,
        ),
      ),
    ),
    WaypointDragEnded e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.waypoint(
          waypointId: e.waypointId,
          vertexRef: e.vertexRef,
        ),
      ),
      intents: [UpdateVertexPosition(e.vertexRef, e.latLng)],
    ),
    VertexDragEnd e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
      intents: [UpdateVertexPosition(e.vertexRef, e.latLng)],
    ),
    _ => null, // pas un event de sélection, on laisse passer au reducer de mode
  };
}
