import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/explore/explore_mode.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/commands/edit_trip_command.dart';

final class TripReadyMode extends TripMode {
  const TripReadyMode(super.tripId, {this.readOnly = true});
  final bool readOnly;

  /// Remonte d'un niveau : morceau → jour → trip → explorateur. Chaque appui
  /// retire un cran de sélection ; sans sélection, on quitte le trip.
  @override
  Transition get back => Transition.withState((st) {
    final selected = st.slots.get(selectionSlot);
    return switch (selected) {
      MapDayRun(:final tripId, :final endsAt) => Transition.set<MapObject>(
        selectionSlot,
        MapDaySegment(tripId: tripId, endsAt: endsAt),
      ),
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

  Transition deleteTripRoute() => Transition.run(
    DeleteRoute(tripId: tripId),
    then: (_, data) =>
        data.fold((l) => Transition.stay(), (_) => TripMode.open(tripId)),
  );
}
