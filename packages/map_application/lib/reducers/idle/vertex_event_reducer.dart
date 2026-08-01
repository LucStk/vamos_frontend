import 'package:map_application/intents/intents.dart';
import '/domain/domain.dart';

import "/events/events.dart";

TransitionResult reduceVertexEvent(MapState state, VertexInputEvent event) {
  return switch (event) {
    VertexButtonDeleteTapped _ => switch (state.selection.vertexIdOrNull) {
      final vertex? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        intents: [RemoveVertex(vertex.id)],
      ),
      null => TransitionResult(nextState: state),
    },

    VertexButtonCreateWaypoint _ => switch (state.selection.vertexIdOrNull) {
      final vertex? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        intents: [CreateWaypointFromVertex(vertex.id)],
      ),
      null => TransitionResult(nextState: state),
    },
    VertexTapped e => TransitionResult(
      nextState: state.copyWith(
        mode: MapMode.idle(),
        selection: MapSelection.vertex(vertex: e.vertex),
      ),
    ),
    VertexDragEnded e => TransitionResult(
      nextState: state.copyWith(mode: MapMode.idle()),
      intents: [UpdateVertexPosition(e.vertexId, e.latLng)],
    ),
    _ => TransitionResult(nextState: state),
  };
}
