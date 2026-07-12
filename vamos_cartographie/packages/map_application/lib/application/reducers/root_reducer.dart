import 'package:map_application/map_application.dart';
import "idle_reducer.dart";

TransitionResult reduce(MapState state, MapInputEvent event) {
  // Les events de sélection sont orthogonaux au mode process.
  final selectionResult = reduceSelection(state, event);
  if (selectionResult != null) return selectionResult;

  return switch (state.mode) {
    Idle _ => reduceIdle(state, event),
    // CursorDrawn e => reduceCursor(state, event, e.latLng),
    // DraggingVertex _ => reduceDraggingVertex(state, event),
    // CreatingSegment _ => reduceCreatingSegment(state, event),
    // SplittingSegment _ => reduceSplittingSegment(state, event),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult? reduceSelection(MapState state, MapInputEvent event) {
  return switch (event) {
    CursorDraggedEnd e => TransitionResult(
      nextState: state.copyWith(
        selection: MapSelection.cursor(latLng: e.latLng),
      ),
    ),
    MapTapped e => TransitionResult(
      nextState: state.copyWith(
        selection: MapSelection.cursor(latLng: e.latLng),
      ),
    ),
    CursorTapped _ => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.none(),
      ),
    ),
    CursorButtonCreateTapped _ => switch (state.selection) {
      CursorSelection(:final latLng) => TransitionResult(
        nextState: state.copyWith(
          mode: MapMode.idle(),
          selection: MapSelection.none(),
        ),
        intents: [CreateSimpleVertex(latLng)],
      ),
      // Sécurité : ce bouton ne devrait être visible que si selection est un curseur.
      // Si on arrive ici, c'est un bug UI en amont -> on ignore proprement.
      _ => TransitionResult(nextState: state),
    },
    VertexButtonDeleteTapped e => TransitionResult(
      nextState: state.copyWith(selection: MapSelection.none()),
      intents: [RemoveVertex(e.vertexRef)],
    ),
    VertexButtonCreateWaypoint e => TransitionResult(
      nextState: state.copyWith(selection: MapSelection.none()),
      intents: [CreateWaypointFromVertex(e.vertexRef)],
    ),
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
