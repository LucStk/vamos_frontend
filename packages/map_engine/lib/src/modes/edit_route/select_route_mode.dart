import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/edit_route.dart';
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
  Transition onTap(TapGesture g) => switch (g.hit) {
    HitObject(object: MapMobilitySpan(:final id, :final start, :final end)) =>
      Transition.to(
        EditSpanMode(tripId, mobilitySpanId: id, start: start, end: end),
      ),
    _ => Transition.stay(),
  };
  // Nouveau drag depuis la route : on repart d'une sélection fermée.
  @override
  Transition onDragStart(DragStartGesture g) => switch (g.source) {
    HitObject(
      object: MapMobilitySpan(),
      detail: RouteHitDetail(:final position),
    ) =>
      Transition.set(routeSelectionSlot, RouteSelection.collapsedAt(position)),
    _ => Transition.stay(),
  };

  @override
  Transition onDragging(DragUpdateGesture g) {
    return switch ((g.source.object, g.detail)) {
      // Le drag qui a créé la sélection : `b` suit le doigt.
      (MapMobilitySpan(), RouteDragDetail(:final position)) =>
        Transition.update(
          routeSelectionSlot,
          (s) => s.withHandleAt(HandleId.b, position),
        ),
      (SelectionHandle(:final id), RouteDragDetail(:final position)) =>
        Transition.update(
          routeSelectionSlot,
          (s) => s.withHandleAt(id, position),
        ),
      _ => Transition.stay(),
    };
  }
}
