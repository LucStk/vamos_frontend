import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/slots/span_bounds_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:trip_application/trip_application.dart';

import 'package:map_engine/src/domain/domain.dart';

/// Édition d'un span de mobilité : ses deux bornes se déplacent librement
/// le long de la route, comme les poignées de `SelectRouteMode`.
class EditSpanMode extends TripMode {
  EditSpanMode(
    super.tripId, {
    required this.mobilitySpanId,
    required this.start,
    required this.end,
  });

  final MobilitySpanId mobilitySpanId;

  /// Bornes initiales du span, en positions sur la polyline.
  final double start, end;

  @override
  Set<Slot> get retainedSlots => {spanBoundsSlot};

  @override
  Iterable<SlotChange> get initialSlots => [
    (spanBoundsSlot, SpanBounds(start: start, end: end)),
  ];

  // Taper un autre span : on passe à son édition, avec ses propres bornes.
  @override
  Transition onTap(TapGesture g) => switch (g.hit) {
    HitObject(object: MapMobilitySpan(:final id, :final start, :final end))
        when id != mobilitySpanId =>
      Transition.to(
        EditSpanMode(
          tripId,
          mobilitySpanId: id,
          start: start.toDouble(),
          end: end.toDouble(),
        ),
      ),
    _ => Transition.stay(),
  };

  // La borne attrapée suit le doigt, sans contrainte.
  @override
  Transition onDragging(DragUpdateGesture g) => switch ((
    g.source.object,
    g.detail,
  )) {
    (SpanBoundHandle(:final bound), RouteDragDetail(:final position)) =>
      Transition.update(spanBoundsSlot, (b) => b.withBoundAt(bound, position)),
    _ => Transition.stay(),
  };
}
