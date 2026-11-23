import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/drag_detail.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/objects.dart';
import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/cursor_actions.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/commands/edit_trip_command.dart';
import 'package:map_engine/src/modes/trip/trip_ready_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/select_route_mode.dart';
import 'package:map_engine/src/modes/trip_edit/waypoint/commands/waypoint_command.dart';

/// Édition du trip, aucun outil actif : les gestes agissent sur les objets
/// existants de la carte.
///
/// - Carte : toucher un endroit libre y pose le curseur, dont le panneau
///   propose d'y créer une étape ou d'y tracer une route.
/// - Étape : la toucher ou la glisser la sélectionne (halo et ancre
///   apparaissent) ; la glisser la déplace (ou glisse son ancre le long de la
///   route), relâcher enregistre.
/// - Route : glisser dessus sélectionne une portion ([SelectRouteMode]).
///
/// Remplace `WaypointsEditMode`.
final class TripEditMode extends TripMode {
  const TripEditMode(super.tripId);

  @override
  Transition get back => Transition.to(TripReadyMode(tripId, readOnly: false));

  /// La croix d'un panneau d'outil ramène ici : ici, elle retire le curseur.
  @override
  Transition get closeTool => CursorActions.clear();

  /// Sélectionne une étape ; le curseur, s'il y en avait un, s'efface.
  Transition _select(MapWaypoint waypoint) => Transition.set<MapObject>(
    selectionSlot,
    waypoint,
  ).clearSlot(searchResultMarkerSlot);

  /// Pose le curseur en [point] et abandonne la sélection (sauf celle du trip
  /// lui-même).
  Transition _placeCursor(WorldOffset point) => Transition.withState(
    (st) => CursorActions.place(point).and<MapObject>(
      selectionSlot,
      tripSelectionOnly(st.slots.get(selectionSlot)),
    ),
  );

  @override
  Transition onTap(TapGesture g) {
    // La position de l'utilisateur : le curseur s'y pose.
    final onUser = CursorActions.onTap(g);
    if (onUser != null) return onUser;

    return switch (g.element) {
      final MapWaypoint waypoint => _select(waypoint),
      // L'ancre d'une étape se manipule en la glissant : un tap n'y change rien.
      MapWaypointAnchor() => Transition.stay(),
      _ => _placeCursor(g.hit?.point ?? g.world),
    };
  }

  /// Glisser depuis la route, y compris son départ ou son arrivée : la
  /// sélection d'une portion commence au point saisi. Le reste du geste est
  /// reçu par [SelectRouteMode], dont
  /// `onDragging` fait suivre le doigt à la poignée `b`.
  ///
  /// Glisser une étape ou son ancre la sélectionne (halo, ancre visible) ;
  /// [onDragging] s'occupe du déplacement.
  @override
  Transition onDragStart(DragStartGesture g) => switch (g.source) {
    HitObject(
      object: MapMobilitySpan() || MapTripStart() || MapTripEnd(),
      detail: RouteHitDetail(:final position),
    ) =>
      Transition.to(SelectRouteMode(tripId, initialPosition: position)),
    HitObject(object: final MapWaypoint waypoint) => _select(waypoint),
    HitObject(object: MapWaypointAnchor(:final waypointId)) => _select(
      MapWaypoint(id: waypointId, tripId: tripId),
    ),
    _ => Transition.stay(),
  };

  @override
  Transition onDragging(DragUpdateGesture g) => switch ((
    g.source.object,
    g.detail,
  )) {
    // Étape déplacée librement, ou accrochée à l'objet survolé.
    (MapWaypoint(:final id), _) => Transition.run(
      PatchWaypointPosition(
        position: g.target?.point ?? g.position.world,
        tripId: tripId,
        waypointId: id,
      ),
    ),
    // Ancre d'une étape glissée le long de la route.
    (MapWaypointAnchor(:final waypointId), RouteDragDetail(:final position)) =>
      Transition.run(
        PatchWaypointAnchorPosition(
          tripId: tripId,
          waypointId: waypointId,
          position: position,
        ),
      ),
    _ => Transition.stay(),
  };

  /// Relâcher une étape ou son ancre : on enregistre côté serveur.
  @override
  Transition onDragEnd(DragEndGesture g) => switch (g.source.object) {
    MapWaypoint(:final id) => Transition.run(
      CommitWaypoint(tripId: tripId, waypointId: id),
    ),
    MapWaypointAnchor(:final waypointId) => Transition.run(
      CommitWaypoint(tripId: tripId, waypointId: waypointId),
    ),
    _ => Transition.stay(),
  };

  Transition deleteTripRoute() => Transition.run(
    DeleteRoute(tripId: tripId),
    then: (_, data) =>
        data.fold((l) => Transition.stay(), (_) => TripMode.open(tripId)),
  );
}
