import 'package:map_application/map_editor.dart';
import 'package:map_application/map_effects.dart';

import '/domain/domain.dart';
import "/events/events.dart";

TransitionResult reduceCursorInputEvents(
  MapState state,
  CursorInputEvent event,
) {
  return switch (event) {
    CursorDraggedStart _ => TransitionResult(nextState: state),
    CursorDragUpdate e => TransitionResult(
      nextState: state.copyWith(
        selection: MapSelection.cursor(latLng: e.latLng),
      ),
    ),
    CursorDoubleTapped _ => TransitionResult(nextState: state),
    CursorDraggedEnd e => TransitionResult(
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
    CursorButtonCreateTapped _ => switch (state.selection.cursorLatLngOrNull) {
      final latLng? => TransitionResult(
        nextState: state.copyWith(
          mode: MapMode.idle(),
          selection: MapSelection.none(),
        ),
        effects: [CreateWaypointFromPosition(latLng)],
      ),
      null => TransitionResult(
        nextState: state,
      ), // bug UI amont : bouton visible hors contexte
    },
  };
}
