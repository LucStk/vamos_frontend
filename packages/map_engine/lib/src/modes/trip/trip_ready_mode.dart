import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/explore/explore_mode.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/commands/edit_trip_command.dart';
import 'package:map_engine/src/modes/trip/move_waypoint_mode.dart';
import 'package:map_engine/src/modes/trip_edit/route/select_route_mode.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';
import 'package:trip_application/trip_application.dart';

final class TripReadyMode extends TripMode {
  const TripReadyMode(super.tripId, {this.readOnly = true});
  final bool readOnly;

  /// Ouvre la fiche du voyage (la sélection porte alors le trip lui-même).
  Transition get showInfo =>
      Transition.set<MapObject>(selectionSlot, MapTrip(tripId));

  /// Ferme la fiche ouverte, quelle qu'elle soit : plus rien n'est sélectionné.
  Transition get closeSheet => Transition.set<MapObject>(selectionSlot, null);

  /// Passe à l'édition du trip (réservé au propriétaire : l'interface ne
  /// propose le bouton qu'hors lecture seule).
  Transition get edit => Transition.to(TripEditMode(tripId));

  /// Déplacer l'étape [id] (réservé au propriétaire) : bascule vers
  /// [MoveWaypointMode], l'étape et son ancre manipulables.
  Transition editWaypoint(WaypointId id) => MoveWaypointMode.start(tripId, id);

  /// Remonte d'un niveau : morceau → jour, puis fiche fermée ; sans fiche
  /// ouverte, on quitte le trip pour l'explorateur.
  @override
  Transition get back => Transition.withState((st) {
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

  @override
  Transition onTap(TapGesture g) {
    final e = g.element;

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
        if (!sameDay) return Transition.set<MapObject>(selectionSlot, e);

        final run = MapDayRun(tripId: tripId, endsAt: endsAt, spanId: spanId);
        return Transition.set<MapObject>(
          selectionSlot,
          current == run ? MapDaySegment(tripId: tripId, endsAt: endsAt) : run,
        );
      });
    }

    if (e is MapObject &&
        (e is MapWaypoint || e is MapMobilitySpan || e is MapDaySegment)) {
      return Transition.withState((st) {
        final current = st.slots.get(selectionSlot);
        // même élément => on désélectionne, sinon on sélectionne le nouveau
        return Transition.set<MapObject>(
          selectionSlot,
          current == e ? null : e,
        );
      });
    }

    // tap dans le vide ou sur un élément non sélectionnable => désélection
    return Transition.set<MapObject>(selectionSlot, null);
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
