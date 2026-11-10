import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_route/slots/span_bounds_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/edit_route/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

class EditSpanMode extends TripMode {
  EditSpanMode(
    super.tripId, {
    required this.mobilitySpanId,
    required this.start,
    required this.end,
  });

  final MobilitySpanId mobilitySpanId;
  final double start;
  final double end;

  @override
  Set<Slot> get retainedSlots => {spanBoundsSlot};

  @override
  Iterable<SlotChange> get initialSlots => [
    (spanBoundsSlot, SpanBounds(start: start, end: end)),
  ];
  @override
  Transition onTap(TapGesture g) => switch (g.hit) {
    HitObject(object: MapMobilitySpan(:final id, :final start, :final end))
        when id != mobilitySpanId =>
      Transition.to(
        EditSpanMode(tripId, mobilitySpanId: id, start: start, end: end),
      ),
    _ => Transition.stay(),
  };
  @override
  Transition onPointerDown(PressGesture g) => switch (g.element) {
    MapSketchPencil() => Transition.update(
      sketchTraceSlot,
      (t) => t.grabbedAt(g.position.world),
    ),
    _ => Transition.stay(),
  };
}
