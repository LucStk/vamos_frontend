import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';
import 'package:map_application/intents/intents.dart';

import '/application/transition_result.dart';

TransitionResult reduceSketch(MapState state, MapInputEvent event) {
  final mode = state.mode;
  if (mode is! SketchMode) return TransitionResult(nextState: state);
  switch (event) {
    case SketchDragUpdate e:
      if (e.touchedVertex != null) {
        return TransitionResult(
          nextState: state,
          intents: [
            CreateSegment(
              startVertexId: mode.vertexStart,
              endVertexId: e.touchedVertex!,
              geometry: mode.itineraire,
              mobilityType: mode.mobilityType,
            ),
          ],
        );
      }
      return TransitionResult(
        nextState: state.copyWith(
          selection: NoSelection(),
          mode: mode.copyWith(itineraire: [...mode.itineraire, e.latLng]),
        ),
      );
    case SketchCancelButtonTapped _:
      return TransitionResult(nextState: MapState(mode: Idle()));

    case _:
      return TransitionResult(nextState: state);
  }
}
