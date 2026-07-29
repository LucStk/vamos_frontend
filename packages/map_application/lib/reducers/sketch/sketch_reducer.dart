import '/domain/domain.dart';
import 'package:map_application/intents/intents.dart';
import "/events/events.dart";

TransitionResult reduceSketch(MapState state, MapEvent event) {
  final mode = state.mode;
  if (mode is! Sketch) return TransitionResult(nextState: state);
  switch (event) {
    case SketchSegmentTapped e:
      return TransitionResult(
        nextState: state.copyWith(
          mode: mode.copyWith(
            correction: RouteCorrection(grabPoint: e.latLng, path: [e.latLng]),
          ),
        ),
      );
    case SketchPencilDragUpdate e:
      final itineraire = [...mode.itineraire, e.latLng];
      if (e.touchedVertex != null) {
        return TransitionResult(
          nextState: state.copyWith(selection: NoSelection(), mode: Idle()),

          intents: [
            CreateSegment(
              startVertexId: mode.vertexStart,
              endVertexId: e.touchedVertex!,
              geometry: itineraire,
              mobilityType: mode.mobilityType,
            ),
          ],
        );
      }
      if (mode.correction != null) {
        final correctionPath = [...mode.correction!.path, e.latLng];
        return TransitionResult(
          nextState: state.copyWith(
            mode: mode.copyWith(
              correction: mode.correction!.copyWith(path: correctionPath),
            ),
          ),
        );
      }
      return TransitionResult(
        nextState: state.copyWith(mode: mode.copyWith(itineraire: itineraire)),
      );
    case SketchCancelButtonTapped _:
      return TransitionResult(nextState: MapState(mode: Idle()));

    case _:
      return TransitionResult(nextState: state);
  }
}
