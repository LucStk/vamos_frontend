import 'package:map_application/map_application.dart';
import 'package:latlong2/latlong.dart';

TransitionResult reduceSketch(MapState state, MapEvent event) {
  final mode = state.mode;
  if (mode is! Sketch) return TransitionResult(nextState: state);
  switch (event) {
    case TapEvent(:final MapSketchSegment tappedElement, :final LatLng latLng):
      return TransitionResult(
        nextState: state.copyWith(
          mode: mode.copyWith(
            correction: RouteCorrection(grabPoint: latLng, path: [latLng]),
          ),
        ),
      );
    case DragUpdateEvent(
      :final MapSketchPencil dragElement,
      :final LatLng latLng,
    ):
      if (mode.correction != null) {
        final correctionPath = [...mode.correction!.path, latLng];
        return TransitionResult(
          nextState: state.copyWith(
            mode: mode.copyWith(
              correction: mode.correction!.copyWith(path: correctionPath),
            ),
          ),
        );
      }
      final itineraire = [...mode.itineraire, latLng];
      return TransitionResult(
        nextState: state.copyWith(mode: mode.copyWith(itineraire: itineraire)),
      );
    case SketchCancelButtonTapped _:
      return TransitionResult(nextState: MapState(mode: Idle()));

    case _:
      return TransitionResult(nextState: state);
  }
}
