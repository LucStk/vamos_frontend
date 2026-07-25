import 'package:map_application/application/map_state.dart';
import 'package:map_application/input_events/input_events.dart';

import '/application/transition_result.dart';

TransitionResult reduceSketch(MapState state, MapInputEvent event) {
  final mode = state.mode;
  if (mode is! SketchMode) return TransitionResult(nextState: state);
  switch (event) {
    case SketchDragUpdate e:
      final selection = (e.touchedVertex != null)
          ? VertexSelection(vertexId: e.touchedVertex!)
          : NoSelection();
      return TransitionResult(
        nextState: state.copyWith(
          selection: selection,
          mode: mode.copyWith(itineraire: [...mode.itineraire, e.latLng]),
        ),
      );
    case SketchCancelButtonTapped _:
      return TransitionResult(nextState: MapState(mode: Idle()));

    case _:
      return TransitionResult(nextState: state);
  }
}
