import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/explore/explore_mode.dart';
import 'package:map_engine/src/modes/place_origin/place_origin_mode.dart';
import 'package:map_engine/src/modes/shared/cursor_actions.dart';
import 'package:map_engine/src/modes/shared/slots/search_result_marker_slot.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/commands/edit_trip_command.dart';
import 'package:map_engine/src/modes/trip/move_waypoint_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/select_route_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_edition_mode.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';
import 'package:trip_application/trip_application.dart';

final class TripReadyMode extends TripMode {
  const TripReadyMode(super.tripId, {this.readOnly = true});
  final bool readOnly;

  /// Ouvre la fiche du voyage (la sélection porte alors le trip lui-même).
  Transition get showInfo => Transition.set<MapObject>(
    selectionSlot,
    MapTrip(tripId),
  ).clearSlot(searchResultMarkerSlot);

  /// Ferme la fiche ouverte, quelle qu'elle soit : plus rien n'est sélectionné.
  Transition get closeSheet => Transition.set<MapObject>(selectionSlot, null);

  /// Passe à l'édition du trip (réservé au propriétaire : l'interface ne
  /// propose le bouton qu'hors lecture seule).
  Transition get edit => Transition.to(TripEditMode(tripId));

  /// Déplacer le départ (voyage qui n'a encore que son origine) : un mode
  /// dédié, où le point suit le doigt, puis retour ici.
  Transition get moveOrigin => Transition.to(PlaceExistingTripOrigin(tripId));

  /// Tracer depuis le départ, le crayon déjà posé dessus : inutile de toucher
  /// l'origine d'abord.
  Transition sketchFromOrigin(WorldOffset origin) =>
      SketchEdition.startFromOrigin(
        HitObject(object: MapTripStart(tripId), point: origin),
      );

  /// Déplacer l'étape [id] (réservé au propriétaire) : bascule vers
  /// [MoveWaypointMode], l'étape et son ancre manipulables.
  Transition editWaypoint(WaypointId id) => MoveWaypointMode.start(tripId, id);

  /// Remonte d'un niveau : morceau → jour, puis fiche fermée ; sans fiche
  /// ouverte, on quitte le trip pour l'explorateur.
  @override
  Transition get back => Transition.withState((st) {
    // Un curseur posé : le retour le retire d'abord.
    if (st.slots.get(searchResultMarkerSlot) != null) {
      return CursorActions.clear();
    }
    final selected = st.slots.get(selectionSlot);
    return switch (selected) {
      MapDayRun(:final tripId, :final endsAt) => Transition.set<MapObject>(
        selectionSlot,
        MapDaySegment(tripId: tripId, endsAt: endsAt),
      ),
      MapTrip() ||
      MapDaySegment() ||
      MapWaypoint() ||
      MapMobilitySpan() => Transition.set<MapObject>(selectionSlot, null),
      _ => Transition.to(
        ExploreMode(),
      ).and<MapObject>(selectionSlot, tripSelectionOnly(selected)),
    };
  });

  /// Pose le curseur en [point] (sur [anchor] s'il repose sur le départ ou
  /// l'arrivée de la route) : aucune fiche ne reste ouverte.
  Transition _placeCursor(
    WorldOffset point, {
    HitObject<RouteElements>? anchor,
  }) => CursorActions.place(
    point,
    anchor: anchor,
  ).and<MapObject>(selectionSlot, null);

  /// Pose le curseur sur [point] (résultat de recherche, par exemple) : toute
  /// fiche ouverte se referme.
  Transition placeCursorAt(WorldOffset point) => _placeCursor(point);

  /// Sélectionne [object] (ou désélectionne tout si null) ; le curseur, s'il y
  /// en avait un, s'efface.
  Transition _select(MapObject? object) =>
      Transition.set<MapObject>(selectionSlot, object)
          .clearSlot(searchResultMarkerSlot);

  @override
  Transition onTap(TapGesture g) {
    final e = g.element;

    // Propriétaire : la position de l'utilisateur, le départ et l'arrivée de la
    // route reçoivent le curseur (qui propose alors de tracer, de créer une
    // étape). Toucher le curseur lui-même ne change rien : son panneau est là.
    if (!readOnly) {
      if (e case MapLocalization(:final position)) {
        return _placeCursor(position);
      }
      if (e is MapSearchResult) return Transition.stay();
      final end = g.hit?.narrow<RouteElements>();
      if (end != null && (e is MapTripStart || e is MapTripEnd)) {
        return _placeCursor(end.point, anchor: end);
      }
    }

    // Un jour est sélectionné : en toucher un morceau l'ouvre ; toucher le
    // morceau ouvert revient au jour.
    if (g.hit case HitObject(
      object: MapDaySegment(:final endsAt),
      detail: DayRunHitDetail(:final spanId),
    )) {
      return Transition.withState((st) {
        final current = st.slots.get(selectionSlot);
        final sameDay = switch (current) {
          MapDaySegment(endsAt: final a) || MapDayRun(endsAt: final a) =>
            a == endsAt,
          _ => false,
        };
        // Autre jour, ou rien : sélection d'un jour, comme d'habitude.
        if (!sameDay) return _select(e);

        final run = MapDayRun(tripId: tripId, endsAt: endsAt, spanId: spanId);
        return _select(
          current == run ? MapDaySegment(tripId: tripId, endsAt: endsAt) : run,
        );
      });
    }

    if (e is MapObject &&
        (e is MapWaypoint || e is MapMobilitySpan || e is MapDaySegment)) {
      return Transition.withState((st) {
        final current = st.slots.get(selectionSlot);
        // même élément => on désélectionne, sinon on sélectionne le nouveau
        return _select(current == e ? null : e);
      });
    }

    // Dans le vide, sans fiche ouverte : le curseur se pose (propriétaire).
    // Sinon, ou sur un élément non sélectionnable : tout se referme.
    if (!readOnly && e == null) {
      return Transition.withState(
        (st) => st.slots.get(selectionSlot) == null
            ? _placeCursor(g.hit?.point ?? g.world)
            : _select(null),
      );
    }
    return _select(null);
  }

  /// Le curseur suit le doigt, et s'accroche à la route qu'il survole.
  @override
  Transition onDragging(DragUpdateGesture g) {
    if (g.source.object is! MapSearchResult) return Transition.stay();
    final onRoute = g.target?.narrow<RouteElements>();
    return CursorActions.place(
      onRoute?.point ?? g.position.world,
      anchor: onRoute,
    );
  }

  /// Glisser sur la route (propriétaire) : la sélection d'une portion commence
  /// au point saisi. Le reste du geste est reçu par [SelectRouteMode]. En
  /// lecture seule, rien : la carte se déplace comme d'habitude.
  @override
  Transition onDragStart(DragStartGesture g) {
    if (readOnly) return Transition.stay();
    return switch (g.source) {
      HitObject(
        object:
            MapMobilitySpan() ||
            MapDaySegment() ||
            MapTripStart() ||
            MapTripEnd(),
        detail: RouteHitDetail(:final position) ||
            DayRunHitDetail(:final position),
      ) => SelectRouteMode.start(tripId, position),
      _ => Transition.stay(),
    };
  }

  Transition deleteTripRoute() => Transition.run(
    DeleteRoute(tripId: tripId),
    then: (_, data) =>
        data.fold((l) => Transition.stay(), (_) => TripMode.open(tripId)),
  );
}
