import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/route/edit_span_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/route_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/slots/route_selection_slot.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';

/// Sélection d'une portion de route, ouverte par un glissement sur la route
/// depuis [TripEditMode]. Le glissement qui l'a ouverte continue ici : la
/// poignée `b` suit le doigt.
class SelectRouteMode extends RouteToolMode {
  SelectRouteMode(super.tripId, {required this.initialPosition});
  final double initialPosition;

  /// Fermer, annuler, retour système : on revient à l'édition sans outil.
  @override
  Transition get back => Transition.to(TripEditMode(tripId));

  @override
  Iterable<SlotChange> get initialSlots => [
    (routeSelectionSlot, RouteSelection.collapsedAt(initialPosition)),
  ];

  @override
  Transition onTap(TapGesture g) => switch (g.hit) {
    HitObject(object: MapMobilitySpan(:final id)) => Transition.to(
      EditSpanMode(tripId, mobilitySpanId: id),
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
      // Le drag qui a créé la sélection (y compris celui commencé dans
      // TripEditMode) : `b` suit le doigt.
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
