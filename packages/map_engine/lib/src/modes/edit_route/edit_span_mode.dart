import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/slots/span_bounds_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:trip_application/trip_application.dart';

import 'package:map_engine/src/domain/domain.dart';

/// Édition d'un span de mobilité : ses deux bornes se déplacent librement
/// le long de la route, comme les poignées de `SelectRouteMode`.
///
/// Le mode ne garde que le brouillon (la borne déplacée). Les positions
/// d'origine et la nature des bornes (extrémité de la route ou jonction)
/// sont lues dans les providers par le canvas et par la validation, qui en
/// déduisent notamment s'il faut proposer de raccourcir la route.
class EditSpanMode extends TripMode {
  EditSpanMode(super.tripId, {required this.mobilitySpanId});

  final MobilitySpanId mobilitySpanId;

  @override
  Set<Slot> get retainedSlots => {spanBoundsSlot};

  // Aucune borne déplacée au départ.
  @override
  Iterable<SlotChange> get initialSlots => [(spanBoundsSlot, null)];

  // Taper un autre span : on passe à son édition, sans modification.
  @override
  Transition onTap(TapGesture g) => switch (g.hit) {
    HitObject(object: MapMobilitySpan(:final id)) when id != mobilitySpanId =>
      Transition.to(EditSpanMode(tripId, mobilitySpanId: id)),
    _ => Transition.stay(),
  };

  // La borne attrapée suit le doigt, sans contrainte. L'ancienne valeur du
  // slot est ignorée : une seule borne peut être modifiée à la fois.
  @override
  Transition onDragging(DragUpdateGesture g) =>
      switch ((g.source.object, g.detail)) {
        (SpanBoundHandle(:final bound), RouteDragDetail(:final position)) =>
          Transition.update(
            spanBoundsSlot,
            (_) => SpanBounds(bound: bound, value: position),
          ),
        _ => Transition.stay(),
      };
}
