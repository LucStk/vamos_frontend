import 'package:map_application/map_application.dart';

TransitionResult reduceIdle(MapState state, MapInputEvent event) {
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
    ButtonStartSegment _ => switch (state.selection.vertexRefOrNull) {
      final vertexRef? => TransitionResult(
        nextState: MapState(
          mode: SketchMode(vertexStart: vertexRef, itineraire: []),
        ),
      ),
      null => TransitionResult(nextState: state),
    },
    CursorButtonCreateTapped _ => switch (state.selection.cursorLatLngOrNull) {
      final latLng? => TransitionResult(
        nextState: state.copyWith(
          mode: MapMode.idle(),
          selection: MapSelection.none(),
        ),
        intents: [CreateSimpleVertex(latLng)],
      ),
      null => TransitionResult(
        nextState: state,
      ), // bug UI amont : bouton visible hors contexte
    },

    VertexButtonDeleteTapped _ => switch (state.selection.vertexRefOrNull) {
      final vertexRef? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        intents: [RemoveVertex(vertexRef)],
      ),
      null => TransitionResult(nextState: state),
    },

    VertexButtonCreateWaypoint _ => switch (state.selection.vertexRefOrNull) {
      final vertexRef? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        intents: [CreateWaypointFromVertex(vertexRef)],
      ),
      null => TransitionResult(nextState: state),
    },
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
    _ => TransitionResult(nextState: state),
  };
}
