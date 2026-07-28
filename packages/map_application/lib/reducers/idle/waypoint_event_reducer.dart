import '/domain/domain.dart';
import "/events/events.dart";

TransitionResult reduceWaypointOuputEvents(
  MapState state,
  WaypointOutputEvent event,
) {
  return switch (event) {
    WaypointCreated e => TransitionResult(
      nextState: MapState(selection: MapSelection.vertex(vertexId: e.vertexId)),
    ),
    _ => TransitionResult(nextState: state),
  };
}
