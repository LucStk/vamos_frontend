import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/sketch/commands/route_command.dart';
import 'package:map_engine/src/modes/sketch/sketch_generating.dart';
import 'package:map_engine/src/modes/sketch/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

class SketchEdition extends TripMode {
  const SketchEdition(super.tripId);

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot};

  /// On saisit le segment : le tracé démarre à ce point.
  /// On saisit le crayon : on retient où, par rapport à sa pointe.
  @override
  Transition onPointerDown(PressGesture g) {
    if (g.hit?.narrow<RouteElements>() case final hit?) {
      return Transition.set(sketchTraceSlot, SketchTrace(startAnchor: hit));
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
  Transition onDragging(DragUpdateGesture g) {
    final hit = g.hit?.narrow<RouteElements>();
    return Transition.update(
      sketchTraceSlot,
      (t) => t.add(g.position.world).endingAt(hit),
    );
  }

  Transition validate() =>
      Transition.withSlot<SketchTrace>(sketchTraceSlot, (trace) {
        if (trace.points.length < 2) return Transition.stay();

        final generating = SketchGenerating(tripId, this);

        return Transition.toAndRun<Either<Failure, EditRoutePayload>>(
          generating,

          EditRoute(tripId: tripId, sketch: trace),
          then: (current, result) {
            final m = current.mode;
            // Annulé ou remplacé entre-temps : on ignore cette réponse.
            if (m is! SketchGenerating || m.token != generating.token) {
              return null;
            }
            return result.fold(
              (failure) => Transition.to(this), // retour au tracé
              (_) => TripMode.open(tripId),
            );
          },
        );
      });

  static Transition stop() =>
      Transition.withMode<SketchEdition>((s) => TripMode.open((s.tripId)));

  /// Depuis le menu ouvert sur l'origine de la route : passe en édition de
  /// tracé, ancré au départ de la route.
  static Transition startFromOrigin(MapHit<MapTripOrigin> hit) => Transition.to(
    SketchEdition(hit.object.tripId),
  ).and(sketchTraceSlot, SketchTrace(startAnchor: hit, points: [hit.point]));
}
