import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/domain/value_objects/mobility_types.dart';

TransitionResult reduceIdle(MapState state, MapInputEvent event) {
  return switch (event) {
    CursorDraggedEnd e => TransitionResult(
      nextState: state.copyWith(
        selection: MapSelection.cursor(latLng: e.latLng),
      ),
    ),
    SegmentTapped e => TransitionResult(
      nextState: state.copyWith(
        selection: MapSelection.segment(segmentId: e.segId),
      ),
    ),
    SegmentButtonDeleteTapped _ => switch (state.selection.segmentIdOrNull) {
      final segmentId? => TransitionResult(
        nextState: state.copyWith(selection: NoSelection()),
        intents: [DeleteSegment(segmentId: segmentId)],
      ),
      null => TransitionResult(nextState: state),
    },

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
    ButtonStartSegment _ => switch (state.selection.vertexIdOrNull) {
      final vertexId? => TransitionResult(
        nextState: MapState(
          mode: SketchMode(
            vertexStart: vertexId,
            itineraire: [],
            mobilityType: MobilityType.bike,
          ),
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

    VertexButtonDeleteTapped _ => switch (state.selection.vertexIdOrNull) {
      final vertexId? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        intents: [RemoveVertex(vertexId)],
      ),
      null => TransitionResult(nextState: state),
    },

    VertexButtonCreateWaypoint _ => switch (state.selection.vertexIdOrNull) {
      final vertexId? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        intents: [CreateWaypointFromVertex(vertexId)],
      ),
      null => TransitionResult(nextState: state),
    },
    VertexTapped e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.vertex(vertexId: e.vertexId),
      ),
    ),
    VertexDragEnd e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
      intents: [UpdateVertexPosition(e.vertexId, e.latLng)],
    ),
    _ => TransitionResult(nextState: state),
  };
}
