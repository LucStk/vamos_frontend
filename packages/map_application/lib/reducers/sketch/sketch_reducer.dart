import '/domain/domain.dart';
import 'package:map_application/intents/intents.dart';
import "/events/events.dart";

TransitionResult reduceSketch(MapState state, MapEvent event) {
  final mode = state.mode;
  if (mode is! Sketch) return TransitionResult(nextState: state);
  switch (event) {
    case SketchDragUpdate e:
      if (e.touchedVertex != null) {
        return TransitionResult(
          nextState: state.copyWith(selection: NoSelection(), mode: Idle()),

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
