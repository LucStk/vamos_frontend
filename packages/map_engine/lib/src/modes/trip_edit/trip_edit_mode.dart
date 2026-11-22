import 'package:map_engine/src/domain/drag_detail.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/objects.dart';
import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/commands/edit_trip_command.dart';
import 'package:map_engine/src/modes/trip/trip_ready_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/edit_span_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/select_route_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/trim_route_mode.dart';
import 'package:map_engine/src/modes/trip_edit/waypoint/commands/waypoint_command.dart';

/// Édition du trip, aucun outil actif : les gestes agissent sur les objets
/// existants de la carte.
///
/// - Étape : toucher la sélectionne, la glisser la déplace (ou glisse son
///   ancre le long de la route), relâcher enregistre.
/// - Route : toucher un tronçon ouvre son édition ([EditSpanMode]) ;
///   glisser dessus sélectionne une portion ([SelectRouteMode]).
///
/// Remplace `WaypointsEditMode`.
final class TripEditMode extends TripMode {
  const TripEditMode(super.tripId);

  @override
  Transition get back => Transition.to(TripReadyMode(tripId, readOnly: false));

  @override
  Transition onTap(TapGesture g) => switch (g.hit) {
    HitObject(object: MapWaypoint()) => Transition.set(
      selectionSlot,
      g.element,
    ),
    HitObject(object: MapMobilitySpan(:final id)) => Transition.to(
      EditSpanMode(tripId, mobilitySpanId: id),
    ),
    _ => Transition.stay(),
  };

  /// Glisser le départ ou l'arrivée de la route : sélection entre cette
  /// extrémité et un curseur ([TrimRouteMode]), pour raccourcir la route.
  ///
  /// Glisser depuis la route : la sélection d'une portion commence au point
  /// saisi. Le reste du geste est reçu par [SelectRouteMode], dont
  /// `onDragging` fait suivre le doigt à la poignée `b`.
  ///
  /// Glisser une étape ou son ancre : rien à préparer, [onDragging] s'en
  /// charge.
  @override
  Transition onDragStart(DragStartGesture g) => switch (g.source) {
    HitObject(
      object: MapTripStart(),
      detail: RouteHitDetail(:final position),
    ) =>
      Transition.to(
        TrimRouteMode(tripId, end: RouteEnd.start, anchor: position),
      ),
    HitObject(object: MapTripEnd(), detail: RouteHitDetail(:final position)) =>
      Transition.to(TrimRouteMode(tripId, end: RouteEnd.end, anchor: position)),
    HitObject(
      object: MapMobilitySpan(),
      detail: RouteHitDetail(:final position),
    ) =>
      Transition.to(SelectRouteMode(tripId, initialPosition: position)),
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
