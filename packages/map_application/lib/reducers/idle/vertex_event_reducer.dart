import 'package:map_application/map_effects.dart';

import '/domain/domain.dart';

import 'package:map_application/map_editor.dart';
import "/events/events.dart";

TransitionResult reduceVertexEvent(MapState state, VertexInputEvent event) {
  return switch (event) {
    VertexButtonDeleteTapped _ => switch (state.selection.vertexIdOrNull) {
      final vertex? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        effects: [RemoveVertex(vertex.id)],
      ),
      null => TransitionResult(nextState: state),
    },

    VertexButtonCreateWaypoint _ => switch (state.selection.vertexIdOrNull) {
      final vertex? => TransitionResult(
        nextState: state.copyWith(selection: MapSelection.none()),
        effects: [CreateWaypointFromVertex(vertex.id)],
      ),
      null => TransitionResult(nextState: state),
    },

    _ => TransitionResult(nextState: state),
  };
}
