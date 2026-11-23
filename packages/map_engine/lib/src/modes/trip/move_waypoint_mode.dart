import 'package:map_engine/src/domain/drag_detail.dart';
import 'package:map_engine/src/domain/objects/objects.dart';
import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/trip_ready_mode.dart';
import 'package:map_engine/src/modes/trip_edit/waypoint/commands/waypoint_command.dart';
import 'package:trip_application/trip_application.dart';

/// Déplacement d'une étape, ouvert depuis la fiche de l'étape en lecture du
/// trip ([TripReadyMode.editWaypoint]).
///
/// Seule l'étape [waypointId] se manipule : on la glisse (elle se pose où on
/// la lâche, ou accrochée à l'objet survolé) ou on glisse son ancre le long de
/// la route ; relâcher enregistre. Tout le reste de la carte est inerte (la
/// carte se déplace et se zoome comme d'habitude).
///
/// La croix sort du mode : retour à la lecture, fiche de l'étape ouverte.
final class MoveWaypointMode extends TripMode {
  const MoveWaypointMode(super.tripId, this.waypointId);

  final WaypointId waypointId;

  MapWaypoint get _waypoint => MapWaypoint(id: waypointId, tripId: tripId);

  /// Entre dans le mode, l'étape sélectionnée (son ancre apparaît) et aucun
  /// curseur de recherche.
  static Transition start(TripId tripId, WaypointId waypointId) =>
      Transition.to(MoveWaypointMode(tripId, waypointId))
          .and<MapObject>(
            selectionSlot,
            MapWaypoint(id: waypointId, tripId: tripId),
          )
          .clearSlot(searchResultMarkerSlot);

  /// Retour à la lecture, la fiche de l'étape ouverte.
  Transition get _leave => Transition.to(
    TripReadyMode(tripId, readOnly: false),
  ).and<MapObject>(selectionSlot, _waypoint);

  @override
  Transition get closeTool => _leave;

  @override
  Transition get back => _leave;

  /// Supprime l'étape, puis retourne à la lecture, sans fiche ouverte.
  Transition removeWaypoint() => Transition.run(
    RemoveWaypoint(tripId: tripId, waypointId: waypointId),
    then: (_, _) => Transition.to(
      TripReadyMode(tripId, readOnly: false),
    ).and<MapObject>(selectionSlot, null),
  );

  // Ni menu contextuel ni sélection : seuls les glissés comptent.
  @override
  Transition onTap(TapGesture g) => Transition.stay();

  @override
  Transition onDragStart(DragStartGesture g) => Transition.stay();

  @override
  Transition onDragging(DragUpdateGesture g) => switch ((
    g.source.object,
    g.detail,
  )) {
    // L'étape, libre ou accrochée à l'objet survolé.
    (MapWaypoint(:final id), _) when id == waypointId => Transition.run(
      PatchWaypointPosition(
        position: g.target?.point ?? g.position.world,
        tripId: tripId,
        waypointId: id,
      ),
    ),
    // Son ancre, glissée le long de la route.
    (
      MapWaypointAnchor(waypointId: final id),
      RouteDragDetail(:final position),
    )
        when id == waypointId =>
      Transition.run(
        PatchWaypointAnchorPosition(
          tripId: tripId,
          waypointId: id,
          position: position,
        ),
      ),
    _ => Transition.stay(),
  };

  /// Relâcher l'étape ou son ancre : on enregistre côté serveur.
  @override
  Transition onDragEnd(DragEndGesture g) => switch (g.source.object) {
    MapWaypoint(:final id) when id == waypointId => Transition.run(
      CommitWaypoint(tripId: tripId, waypointId: id),
    ),
    MapWaypointAnchor(waypointId: final id) when id == waypointId =>
      Transition.run(CommitWaypoint(tripId: tripId, waypointId: id)),
    _ => Transition.stay(),
  };
}
