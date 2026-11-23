import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/commands/sketch_command.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_edition_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_generating_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

/// Itinéraire calculé pour le tracé, affiché sans avoir été ajouté à la route.
///
/// Trois issues : revenir au tracé ([backToSketch]), demander une autre
/// prévisualisation ([recalculate]), ou intégrer celle-ci à la route et
/// quitter le tracé ([commit]).
final class SketchPreviewing extends SketchToolMode {
  const SketchPreviewing(super.tripId, {required this.preview, this.failure});

  final PreviewRoutePayload preview;

  /// Échec de la dernière validation : la proposition reste affichée.
  final Failure? failure;

  /// À afficher dans le panneau : l'échec de la validation, sinon celui du
  /// routeur (la prévisualisation reprend alors le tracé à main levée).
  Failure? get error => failure ?? preview.routingFailure;

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot, searchResultMarkerSlot}; // pour y revenir

  /// Retour, croix et retour système quittent l'édition (comme partout) ;
  /// la proposition est abandonnée. Pour revenir au tracé : [backToSketch].
  @override
  Transition get exit =>
      super.exit.running(DiscardSketchPreview(tripId: tripId));

  // Gestes inertes : rien à toucher sur la carte pendant la prévisualisation.
  @override
  Transition onTap(TapGesture g) => Transition.stay();
  @override
  Transition onDragEnd(DragEndGesture g) => Transition.stay();

  /// Revient au tracé à main levée, intact. La proposition est abandonnée.
  Transition backToSketch() => Transition.to(
    SketchEdition(tripId),
  ).running(DiscardSketchPreview(tripId: tripId));

  /// Autre prévisualisation du même tracé, par exemple avec une autre mobilité.
  Transition recalculate(MobilityType mobilityType) =>
      SketchGenerating.preview(tripId, mobilityType);

  /// Intègre la prévisualisation à la route, puis quitte le tracé.
  Transition commit() => Transition.run(
    CommitSketchPreview(tripId: tripId, proposalId: preview.proposalId),
    then: (current, result) {
      // Quitté entre-temps (retour, nouvelle prévisualisation) : on ignore.
      if (!identical(current.mode, this)) return null;
      return result.fold(
        // La proposition reste affichée, avec la raison de l'échec.
        (failure) => Transition.to(
          SketchPreviewing(tripId, preview: preview, failure: failure),
        ),
        (_) => TripMode.open(tripId),
      );
    },
  );
}
