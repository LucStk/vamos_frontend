import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/route_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/sketch_generating.dart';
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

  // SketchEdition
  @protected
  Command<Either<Failure, EditRoutePayload>> buildCommand(SketchTrace trace);

  Transition<AppMode> validate() =>
      Transition.withSlot<AppMode, SketchTrace>(sketchTraceSlot, (trace) {
        if (trace.points.length < 2) return Transition.stay();

        final generating = SketchGenerating(tripId, this);

        return Transition.toAndRun<AppMode, Either<Failure, EditRoutePayload>>(
          generating,
          buildCommand(trace),
          then: (current, result) {
            final m = current.mode;
            // Annulé ou remplacé entre-temps : on ignore cette réponse.
            if (m is! SketchGenerating || m.token != generating.token) {
              return null;
            }
            return result.fold(
              (failure) => Transition.to<AppMode>(this), // retour au tracé
              (_) => TripMode.open(tripId),
            );
          },
        );
      });

  static Transition<AppMode> stop() =>
      Transition.withMode<AppMode, SketchEdition>(
        (s) => TripMode.open((s.tripId)),
      );
}

final class SketchExtend extends SketchEdition {
  const SketchExtend(super.tripId);
  @override
  Command<Either<Failure, EditRoutePayload>> buildCommand(SketchTrace t) =>
      ExtendRoute(
        tripId: tripId,
        geometry: t.points,
        mobilityType: t.mobilityType,
      );

  static Transition<AppMode> start(TripId tripId, WorldOffset from) =>
      Transition.to<AppMode>(
        SketchExtend(tripId),
      ).and(sketchTraceSlot, SketchTrace.from(from));
}

final class SketchPrepend extends SketchEdition {
  const SketchPrepend(super.tripId);

  static Transition<AppMode> start(TripId tripId, WorldOffset from) =>
      Transition.to<AppMode>(
        SketchPrepend(tripId),
      ).and(sketchTraceSlot, SketchTrace.from(from));

  @override
  Command<Either<Failure, EditRoutePayload>> buildCommand(SketchTrace t) =>
      PrependRoute(
        tripId: tripId,
        geometry: t.points.reversed.toList(),
        mobilityType: t.mobilityType,
      );
}
