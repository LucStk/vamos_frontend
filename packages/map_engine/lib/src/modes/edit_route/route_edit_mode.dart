import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/edit_route.dart';
import 'package:map_engine/src/modes/edit_route/select_route_mode.dart';
import 'package:map_engine/src/modes/edit_trip/commands/edit_trip_command.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

final class RouteEditMode extends TripMode {
  const RouteEditMode(super.tripId);

  @override
  Transition onDragStart(DragStartGesture g) {
    final res = switch (g.source) {
      HitObject(
        object: MapMobilitySpan(),
        detail: RouteHitDetail(:final position),
      ) =>
        Transition.to(SelectRouteMode(tripId, initialPosition: position)),
      _ => Transition.stay(),
    };

    return res;
  }

  @override
  Transition onPointerDown(PressGesture g) => switch (g.hit) {
    HitObject(object: MapMobilitySpan(:final id)) => Transition.to(
      SelectSpanMode(tripId, mobilitySpanId: id),
    ),
    _ => Transition.stay(),
  };

  Transition deleteTripRoute() => Transition.run(
    DeleteRoute(tripId: tripId),
    then: (_, data) =>
        data.fold((l) => Transition.stay(), (_) => TripMode.open(tripId)),
  );
}
