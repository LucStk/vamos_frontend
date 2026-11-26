import 'package:map_engine/src/gesture_engine/gesture_engine.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

class ExploreMode extends AppMode {
  const ExploreMode();

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition onTap(TapGesture g) => switch (g.element) {
    // Premier appui : le voyage passe en avant, sa carte résumé s'affiche en
    // bas. Appui sur le voyage déjà en avant : on entre dedans (le cadrage
    // fait partie de l'ouverture, voir [TripMode.open]).
    MapTrip e => Transition.withState((st) {
      final front = st.slots.get(selectionSlot);
      // Rien en avant (le panneau des cartes est réduit à son bouton) :
      // l'appui entre dans le voyage, comme avant les cartes. Avec le panneau
      // ouvert, l'appui déplace la mise en avant, et seul le voyage déjà en
      // avant s'ouvre.
      return front is! MapTrip || front.id == e.id
          ? TripMode.open(e.id, focus: true)
          : selectTrip(e);
    }),
    // À côté des tracés : plus rien en avant, les cartes se retirent.
    _ => Transition.set<MapObject>(selectionSlot, null),
  };

  static Transition selectTrip(MapTrip trip) =>
      Transition.set(selectionSlot, trip);
}
