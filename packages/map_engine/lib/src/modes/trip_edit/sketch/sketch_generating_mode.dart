import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/commands/sketch_command.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_edition_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_preview_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

final class SketchGenerating extends SketchToolMode {
  SketchGenerating(super.tripId, this.editing) : token = Object();

  final SketchEdition editing; // le mode d'où l'on vient
  final Object token; // identifie la requête en cours

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot, searchResultMarkerSlot}; // la trace reste affichée

  /// Quitter pendant le calcul : sa réponse sera ignorée, la proposition qu'il
  /// crée est abandonnée (l'abandon passe après lui dans la file du trip).
  @override
  Transition get exit =>
      super.exit.running(DiscardSketchPreview(tripId: tripId));

  // Gestes inertes. Surcharge `onTap` si `TripMode` sort vers Explore,
  // comme tu l'as fait dans `TripValidatingMode`.
  @override
  Transition onTap(TapGesture g) => Transition.stay();

  /// Calcule l'itinéraire du tracé retenu dans [sketchTraceSlot], sans toucher
  /// à la route, puis ouvre [SketchPreviewing]. En cas d'échec, retour au
  /// tracé. Depuis [SketchEdition] comme depuis [SketchPreviewing] (autre
  /// prévisualisation, avec d'autres options).
  static Transition preview(TripId tripId, MobilityType mobilityType) =>
      Transition.withSlot<SketchTrace>(sketchTraceSlot, (trace) {
        if (trace.points.length < 2) return Transition.stay();
        return previewTrace(tripId, trace, mobilityType);
      });

  /// Idem pour un tracé donné, qui devient celui du slot : on y revient si
  /// l'on abandonne l'aperçu.
  static Transition previewTrace(
    TripId tripId,
    SketchTrace trace,
    MobilityType mobilityType,
  ) {
    final generating = SketchGenerating(tripId, SketchEdition(tripId));

    return Transition.to(generating)
        .and(sketchTraceSlot, trace)
        .running(
          PreviewSketch(
            tripId: tripId,
            mobilityType: mobilityType,
            sketch: trace,
          ),
          then: (current, result) {
            final m = current.mode;
            // Annulé ou remplacé entre-temps : on ignore cette réponse.
            if (m is! SketchGenerating || m.token != generating.token) {
              return null;
            }
            return result.fold(
              (failure) => Transition.to(
                SketchEdition(tripId, failure: failure),
              ), // retour au tracé
              (preview) =>
                  Transition.to(SketchPreviewing(tripId, preview: preview)),
            );
          },
        );
  }
}
