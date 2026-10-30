import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/command/route_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/sketch/sketch_generating.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/slots/sketch_trace_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

class SketchEdition extends TripMode {
  const SketchEdition(super.tripId);

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot};

  /// On saisit le segment : le tracé démarre à ce point.
  /// On saisit le crayon : on retient où, par rapport à sa pointe.
  @override
  Transition<AppMode> onPointerDown(PressGesture g) {
    print("Sketch pointerDown ${g.element}");
    if (g.hit?.narrow<RouteElements>() case final hit?) {
      print("Sketch hit ${g.element}");
      return Transition.set(
        sketchTraceSlot,
        SketchTrace(startAnchor: SketchAnchor(hit)),
      );
    }
    return switch (g.element) {
      MapSketchPencil() => Transition.update(
        sketchTraceSlot,
        (t) => t.grabbedAt(g.position.world),
      ),
      _ => Transition.stay(),
    };
  }

  // onDragging reste identique : add() applique maintenant le décalage.
  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      g.dragged is MapSketchPencil
      ? Transition.update(sketchTraceSlot, (t) => t.add(g.position.world))
      : Transition.stay();

  Transition<AppMode> validate() =>
      Transition.withSlot<AppMode, SketchTrace>(sketchTraceSlot, (trace) {
        if (trace.points.length < 2) return Transition.stay();

        final generating = SketchGenerating(tripId, this);

        return Transition.toAndRun<AppMode, Either<Failure, EditRoutePayload>>(
          generating,

          EditRoute(tripId: tripId, sketch: trace),
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

  /// Depuis le menu ouvert sur l'origine de la route : passe en édition de
  /// tracé, ancré au départ de la route.
  static Transition<AppMode> startFromOrigin(MapHit<MapTripOrigin> hit) =>
      Transition.to<AppMode>(SketchEdition(hit.object.tripId)).and(
        sketchTraceSlot,
        SketchTrace(startAnchor: SketchAnchor(hit), points: [hit.point]),
      );
}
