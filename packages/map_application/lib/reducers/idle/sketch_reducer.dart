import '/domain/domain.dart';
import 'package:trip_application/topology/domain/value_objects/mobility_types.dart';

import "/events/events.dart";

import 'package:map_application/map_editor.dart';

TransitionResult reduceSketchInputEvents(
  MapState state,
  SketchInputEvent event,
) {
  return switch (event) {
    SketchModeActivate _ => switch (state.selection.vertexIdOrNull) {
      final vertex? => TransitionResult(
        nextState: MapState(
          mode: MapMode.sketchMode(
            vertexStart: vertex.id,
            itineraire: [vertex.latLng],
            mobilityType: MobilityType.bike,
          ),
        ),
      ),
      null => TransitionResult(nextState: state),
    },

    _ => TransitionResult(nextState: state),
  };
}
