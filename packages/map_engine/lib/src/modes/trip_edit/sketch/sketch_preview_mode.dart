import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/cursor_actions.dart';
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
/// Le crayon reste posé au bout de l'itinéraire : toucher la carte, y chercher
/// un point ou toucher sa position y pose le curseur, d'où l'on génère la suite
/// (la route calculée s'allonge). Quatre issues : revenir au tracé
/// ([backToSketch]), demander une autre prévisualisation ([recalculate]),
/// supprimer l'itinéraire et le tracé ([delete]), ou intégrer l'itinéraire à la
/// route et quitter le tracé ([commit]).
final class SketchPreviewing extends SketchToolMode {
  const SketchPreviewing(
    super.tripId, {
    required this.preview,
    this.failure,
    this.directRoute = false,
  });

  final PreviewRoutePayload preview;

  /// L'itinéraire est un vrai calcul entre des passages (route générée vers un
  /// point) : un recalcul garde le même mode.
  final bool directRoute;

  /// Échec de la dernière validation : la proposition reste affichée.
  final Failure? failure;

  /// À afficher dans le panneau : l'échec de la validation, sinon celui du
  /// routeur (la prévisualisation reprend alors le tracé à main levée).
  Failure? get error => failure ?? preview.routingFailure;

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot, searchResultMarkerSlot}; // pour y revenir

  /// Retour, croix et retour système ferment l'outil (retour à l'édition) ;
  /// la proposition est abandonnée. Pour revenir au tracé : [backToSketch].
  @override
  Transition get closeTool =>
      super.closeTool.running(DiscardSketchPreview(tripId: tripId));

  /// Toucher la carte ou la position de l'utilisateur y pose le curseur.
  @override
  Transition onTap(TapGesture g) => CursorActions.onTap(g) ?? Transition.stay();

  // Rien d'autre à toucher sur la carte pendant la prévisualisation.
  @override
  Transition onDragEnd(DragEndGesture g) => Transition.stay();

  /// Revient au tracé à main levée, intact. La proposition est abandonnée.
  Transition backToSketch() => Transition.to(
    SketchEdition(tripId),
  ).running(DiscardSketchPreview(tripId: tripId));

  /// Supprime l'itinéraire calculé et le tracé : on retrouve l'outil sans rien
  /// de dessiné. La proposition est abandonnée.
  Transition delete() => Transition.to(SketchEdition(tripId))
      .clearSlot(sketchTraceSlot)
      .running(DiscardSketchPreview(tripId: tripId));

  /// Autre prévisualisation du même tracé, par exemple avec une autre mobilité.
  Transition recalculate(MobilityType mobilityType) => SketchGenerating.preview(
    tripId,
    mobilityType,
    directRoute: directRoute,
  );

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
