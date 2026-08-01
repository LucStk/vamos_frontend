import '/domain/domain.dart';
import "/events/events.dart";

import 'package:map_application/map_editor.dart';

TransitionResult reduceWaypointOuputEvents(
  MapState state,
  WaypointOutputEvent event,
) {
  return switch (event) {
    WaypointCreated e => TransitionResult(
      nextState: MapState(selection: MapSelection.vertex(vertex: e.vertex)),
    ),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult reduceWaypointInputEvents(
  MapState state,
  WaypointOutputEvent event,
) {
  return switch (event) {
    WaypointCreated e => TransitionResult(
      nextState: MapState(selection: MapSelection.vertex(vertex: e.vertex)),
    ),
    _ => TransitionResult(nextState: state),
  };
}
