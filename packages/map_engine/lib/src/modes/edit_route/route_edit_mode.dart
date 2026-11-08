import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/edit_mobility_span_mode.dart';
import 'package:map_engine/src/modes/edit_trip/commands/edit_trip_command.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

final class RouteEditMode extends TripMode {
  const RouteEditMode(super.tripId);
  @override
  Transition onPointerDown(PressGesture g) => switch (g.element) {
    MapMobilitySpan e => Transition.to(
      EditMobilitySpanMode(
        tripId,
        mobilitySpanId: e.id,
        spanStartIndex: e.spanStartIndex,
      ),
    ),
    _ => Transition.stay(),
  };

  Transition deleteTripRoute() => Transition.run(
    DeleteRoute(tripId: tripId),
    then: (_, data) =>
        data.fold((l) => Transition.stay(), (_) => TripMode.open(tripId)),
  );
}
