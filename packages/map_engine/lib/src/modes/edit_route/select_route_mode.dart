import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/slots/route_selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

class SelectRouteMode extends TripMode {
  SelectRouteMode(super.tripId, {required this.initialPosition});

  final double initialPosition;

  @override
  Iterable<SlotChange> get initialSlots => [
    (routeSelectionSlot, RouteSelection.collapsedAt(initialPosition)),
  ];

  @override
  Transition onPointerDown(PressGesture g) => switch (g.hit) {
    HitObject(
      object: MapMobilitySpan(),
      detail: RouteHitDetail(:final position),
    ) =>
      Transition.to(SelectRouteMode(tripId, initialPosition: position)),
    _ => Transition.stay(),
  };

  // SelectionHandle(tripId, id) : même objet qu'avant, avec `id` à la place de `side`.

  @override
  Transition onDragging(DragUpdateGesture g) =>
      switch ((g.source.object, g.detail)) {
        (SelectionHandle(:final id), RouteDragDetail(:final position)) =>
          Transition.update(
            routeSelectionSlot,
            (s) => s.withHandleAt(id, position),
          ),
        _ => Transition.stay(),
      };
}
