import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/command/route_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';
import 'package:map_engine/src/mode_machine/slots/sketch_trace_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

abstract class SketchEdition extends TripEditableMode {
  const SketchEdition(super.tripId);

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapWaypoint e => Transition.overlay(WaypointMenu(e)),
    MapSketchPencil p => Transition.overlay(PencilMenu(p)),
    _ => Transition.stay(),
  };

  /// On saisit le segment : le tracé démarre à ce point.
  /// On saisit le crayon : on retient où, par rapport à sa pointe.
  @override
  Transition<AppMode> onPointerDown(PressGesture g) => switch (g.element) {
    MapSection() => Transition.set(
      sketchTraceSlot,
      SketchTrace.from(g.position.world),
    ),
    MapSketchPencil() => Transition.update(
      sketchTraceSlot,
      (t) => t.grabbedAt(g.position.world),
    ),
    _ => Transition.stay(),
  };

  // onDragging reste identique : add() applique maintenant le décalage.
  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      g.dragged is MapSketchPencil
      ? Transition.update(sketchTraceSlot, (t) => t.add(g.position.world))
      : Transition.stay();

  // --- Intents ---
  Transition<AppMode> validate();

  static Transition<AppMode> stop() =>
      Transition.withMode<AppMode, SketchEdition>(
        (s) => TripMode.open((s.tripId)),
      );
}

final class SketchExtend extends SketchEdition {
  const SketchExtend(super.tripId);

  static Transition<AppMode> start(TripId tripId, WorldOffset from) =>
      Transition.to<AppMode>(
        SketchExtend(tripId),
      ).and(sketchTraceSlot, SketchTrace.from(from));

  @override
  Transition<AppMode> validate() => Transition.withSlot(
    sketchTraceSlot,
    (slot) => Transition.run(
      ExtendRoute(
        tripId: tripId,
        geometry: slot.points,
        mobilityType: slot.mobilityType,
      ),
      then: (route, data) => data.fold(
        (failure) => Transition.stay(),
        (data) => TripMode.open(tripId),
      ),
    ),
  );
}

final class SketchPrepend extends SketchEdition {
  const SketchPrepend(super.tripId);

  static Transition<AppMode> start(TripId tripId, WorldOffset from) =>
      Transition.to<AppMode>(
        SketchPrepend(tripId),
      ).and(sketchTraceSlot, SketchTrace.from(from));

  @override
  Transition<AppMode> validate() => Transition.withSlot(
    sketchTraceSlot,
    (slot) => Transition.run(
      PrependRoute(
        tripId: tripId,
        geometry: slot.points.reversed.toList(),
        mobilityType: slot.mobilityType,
      ),
      then: (route, data) => data.fold(
        (failure) => Transition.stay(),
        (data) => TripMode.open(tripId),
      ),
    ),
  );
}
