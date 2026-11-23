import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/route/commands/route_command.dart';
import 'package:map_engine/src/modes/trip_edit/route/route_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/select_route_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/slots/route_selection_slot.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';
import 'package:trip_application/trip_application.dart';

/// Re-routage de la portion sélectionnée, affiché sans avoir été écrit dans la
/// route. Ouvert depuis [SelectRouteMode].
///
/// Tant que [preview] est null, le calcul est en cours. Trois issues :
/// revenir à la sélection ([backToSelection]), demander un autre calcul
/// ([recalculate]), ou intégrer celui-ci à la route ([commit]).
final class PortionPreviewMode extends RouteToolMode {
  PortionPreviewMode(
    super.tripId, {
    required this.selection,
    required this.mobilityType,
    this.preview,
    this.failure,
  });

  /// Sélection d'où l'on vient : restituée au retour.
  final RouteSelection selection;
  final MobilityType mobilityType;

  /// Null : calcul en cours.
  final PreviewRoutePayload? preview;

  /// Échec de la dernière validation : la proposition reste affichée.
  final Failure? failure;

  bool get isLoading => preview == null;

  /// À afficher dans le panneau : l'échec de la validation, sinon celui du
  /// routeur (la prévisualisation reprend alors une ligne droite).
  Failure? get error => failure ?? preview?.routingFailure;

  /// Retour, croix et retour système ferment l'outil (retour à l'édition) ;
  /// la proposition est abandonnée. Pour revenir à la sélection : [backToSelection].
  @override
  Transition get closeTool =>
      super.closeTool.running(DiscardPortionPreview(tripId: tripId));

  // Gestes inertes : rien à toucher sur la carte pendant la prévisualisation.
  @override
  Transition onTap(TapGesture g) => Transition.stay();
  @override
  Transition onDragEnd(DragEndGesture g) => Transition.stay();

  /// Calcule le re-routage de [selection] avec [mobilityType], sans toucher à
  /// la route, puis ouvre l'aperçu. En cas d'échec, retour à la sélection.
  static Transition start(
    TripId tripId,
    RouteSelection selection,
    MobilityType mobilityType,
  ) {
    final loading = PortionPreviewMode(
      tripId,
      selection: selection,
      mobilityType: mobilityType,
    );
    return Transition.to(loading).running(
      PreviewPortion(
        tripId: tripId,
        from: selection.start,
        to: selection.end,
        mobilityType: mobilityType,
      ),
      then: (current, result) {
        // Annulé ou remplacé entre-temps : on ignore cette réponse.
        if (!identical(current.mode, loading)) return null;
        return result.fold(
          (failure) => Transition.to(
            SelectRouteMode.restoring(tripId, selection, failure: failure),
          ),
          (preview) => Transition.to(
            PortionPreviewMode(
              tripId,
              selection: selection,
              mobilityType: mobilityType,
              preview: preview,
            ),
          ),
        );
      },
    );
  }

  /// Revient à la sélection, intacte. La proposition est abandonnée (aussi
  /// pendant le calcul : l'abandon passe après lui dans la file du trip).
  Transition backToSelection() => Transition.to(
    SelectRouteMode.restoring(tripId, selection),
  ).running(DiscardPortionPreview(tripId: tripId));

  /// Autre calcul sur la même portion, par exemple avec une autre mobilité.
  Transition recalculate(MobilityType mobilityType) =>
      start(tripId, selection, mobilityType);

  /// Intègre l'aperçu à la route, puis revient à l'édition sans outil.
  Transition commit() {
    final proposal = preview;
    if (proposal == null) return Transition.stay();
    return Transition.run(
      CommitPortionPreview(tripId: tripId, proposalId: proposal.proposalId),
      then: (current, result) {
        // Quitté entre-temps (retour, nouveau calcul) : on ignore.
        if (!identical(current.mode, this)) return null;
        return result.fold(
          // La proposition reste affichée, avec la raison de l'échec.
          (failure) => Transition.to(
            PortionPreviewMode(
              tripId,
              selection: selection,
              mobilityType: mobilityType,
              preview: proposal,
              failure: failure,
            ),
          ),
          (_) => Transition.to(TripEditMode(tripId)),
        );
      },
    );
  }
}
