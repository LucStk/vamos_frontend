import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/edit_route/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

class SelectSpanMode extends TripMode {
  SelectSpanMode(super.tripId, {required this.mobilitySpanId});

  final MobilitySpanId mobilitySpanId;

  //   @override
  //   Set<Slot> get retainedSlots => {mobilitySpanSlot};
  //
  //   @override
  //   Iterable<SlotChange> get initialSlots => [
  //     (mobilitySpanSlot, MobilitySpanSelected(mobilitySpanId: mobilitySpanId)),
  //   ];

  @override
  Transition onPointerDown(PressGesture g) => switch (g.element) {
    MapSketchPencil() => Transition.update(
      sketchTraceSlot,
      (t) => t.grabbedAt(g.position.world),
    ),
    _ => Transition.stay(),
  };
}
