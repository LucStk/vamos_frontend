import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/route/commands/route_command.dart';
import 'package:map_engine/src/modes/trip_edit/route/portion_preview_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/route_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/slots/route_selection_slot.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';
import 'package:trip_application/trip_application.dart';

/// Sélection d'une portion de route, ouverte par un glissement sur la route
/// depuis [TripEditMode]. Le glissement qui l'a ouverte continue ici : la
/// poignée `b` suit le doigt.
///
/// Elle peut aussi s'ouvrir en saisissant le départ ou l'arrivée de la route.
///
/// Sur la portion sélectionnée : la re-router ([preview]), lui donner une
/// mobilité en gardant son tracé ([keepTrace]), ou, si un curseur est sur une
/// extrémité de la route, la supprimer ([trim]).
class SelectRouteMode extends RouteToolMode {
  SelectRouteMode(super.tripId, {required this.initialPosition})
    : restoredSelection = null,
      failure = null;

  /// Retrouve [selection] telle qu'elle était, au retour d'un aperçu ou après
  /// l'échec d'une demande.
  SelectRouteMode.restoring(
    super.tripId,
    RouteSelection selection, {
    this.failure,
  }) : initialPosition = selection.a,
       restoredSelection = selection;

  final double initialPosition;
  final RouteSelection? restoredSelection;

  /// Échec de la dernière demande, à afficher dans le panneau.
  final Failure? failure;

  @override
  Iterable<SlotChange> get initialSlots => [
    (
      routeSelectionSlot,
      restoredSelection ?? RouteSelection.collapsedAt(initialPosition),
    ),
  ];

  /// Re-route la portion sélectionnée avec [mobilityType], en aperçu : rien
  /// n'est écrit avant la validation. Rien à faire si la sélection est vide.
  Transition preview(MobilityType mobilityType) =>
      Transition.withSlot<RouteSelection>(routeSelectionSlot, (s) {
        if (s.isCollapsed) return Transition.stay();
        return PortionPreviewMode.start(tripId, s, mobilityType);
      });

  /// Donne [mobilityType] à la portion sélectionnée en gardant son tracé (pas
  /// de recalcul), puis revient à l'édition. Le serveur fusionne avec les
  /// spans voisins de même mobilité.
  Transition keepTrace(MobilityType mobilityType) =>
      Transition.withSlot<RouteSelection>(routeSelectionSlot, (s) {
        if (s.isCollapsed) return Transition.stay();
        return Transition.run(
          SetPortionMobility(
            tripId: tripId,
            from: s.start,
            to: s.end,
            mobilityType: mobilityType,
          ),
          then: (current, result) {
            // Quitté entre-temps : on ignore cette réponse.
            if (current.mode is! SelectRouteMode) return null;
            return result.fold(
              (failure) => Transition.to(
                SelectRouteMode.restoring(tripId, s, failure: failure),
              ),
              (_) => Transition.to(TripEditMode(tripId)),
            );
          },
        );
      });

  /// Toucher une étape ou la carte passe à l'édition (étape sélectionnée,
  /// ou curseur posé) ; le reste ne fait rien.
  @override
  Transition onTap(TapGesture g) =>
      TripEditMode.leavingToTap(tripId, g) ?? Transition.stay();

  // Nouveau drag depuis la route : on repart d'une sélection fermée.
  @override
  Transition onDragStart(DragStartGesture g) => switch (g.source) {
    HitObject(
      object: MapMobilitySpan() || MapTripStart() || MapTripEnd(),
      detail: RouteHitDetail(:final position),
    ) =>
      Transition.set(routeSelectionSlot, RouteSelection.collapsedAt(position)),
    _ => Transition.stay(),
  };

  @override
  Transition onDragging(DragUpdateGesture g) {
    return switch ((g.source.object, g.detail)) {
      // Le drag qui a créé la sélection (y compris celui commencé dans
      // TripEditMode, ou depuis une extrémité de la route) : `b` suit le doigt.
      (
        MapMobilitySpan() || MapTripStart() || MapTripEnd(),
        RouteDragDetail(:final position),
      ) =>
        Transition.update(
          routeSelectionSlot,
          (s) => s.withHandleAt(HandleId.b, position),
        ),
      (SelectionHandle(:final id), RouteDragDetail(:final position)) =>
        Transition.update(
          routeSelectionSlot,
          (s) => s.withHandleAt(id, position),
        ),
      _ => Transition.stay(),
    };
  }

  /// Supprime la portion sélectionnée, de l'extrémité [end] qu'elle atteint au
  /// curseur le plus proche, puis revient à l'édition.
  Transition trim(RouteEnd end) =>
      Transition.withSlot<RouteSelection>(routeSelectionSlot, (s) {
        if (s.isCollapsed) return Transition.stay();
        return Transition.run(
          TrimRoute(
            tripId: tripId,
            end: end,
            at: switch (end) {
              RouteEnd.start => s.end,
              RouteEnd.end => s.start,
            },
          ),
          then: (current, result) {
            // Quitté entre-temps : on ignore cette réponse.
            if (current.mode is! SelectRouteMode) return null;
            return result.fold(
              (failure) => Transition.to(
                SelectRouteMode.restoring(tripId, s, failure: failure),
              ),
              (_) => Transition.to(TripEditMode(tripId)),
            );
          },
        );
      });
}
