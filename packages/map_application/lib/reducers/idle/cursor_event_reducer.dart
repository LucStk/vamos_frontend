import 'package:map_application/map_editor.dart';
import 'package:map_application/map_effects.dart';

import '/domain/domain.dart';
import "/events/events.dart";

TransitionResult reduceCursorInputEvents(
  MapState state,
  CursorInputEvent event,
) {
  return switch (event) {
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
