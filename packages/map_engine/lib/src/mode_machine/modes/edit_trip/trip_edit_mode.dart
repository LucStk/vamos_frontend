import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

abstract class TripEditableMode extends TripMode {
  const TripEditableMode(super.tripId);
}

final class TripActiveMode extends TripEditableMode {
  const TripActiveMode(super.tripId);
  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapTripOrigin _ => Transition.overlay<AppMode>(TripOriginMenu(tripId)),
    MapTripEnd _ => Transition.overlay<AppMode>(TripEndMenu(tripId)),
    MapSection s => Transition.overlay<AppMode>(
      SectionMenu(tripId: tripId, sectionId: s.id, at: g.world),
    ),
    _ => Transition.stay(),
  };

  @override
  Transition<AppMode> onLongPress(LongPressGesture g) => switch (g.element) {
    _ => Transition.overlay(MapPointMenu(tripId: tripId, at: g.world)),
  };
  @override
  Transition<AppMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(MapPointMenu(tripId: tripId, at: g.world)),
      };

  /// Appelé quand on touche la carte.
  Transition<AppMode> onCardTap() =>
      Transition.to<AppMode>(TripValidatingMode(tripId));
}

/// Transitoire : l'édition est terminée, le serveur valide.
final class TripValidatingMode extends TripEditableMode {
  const TripValidatingMode(super.tripId);

  // Pas de onLongPress / onSecondaryTap : l'édition est impossible.

  // Surcharge indispensable : le tap dans le vide de TripMode
  // sortirait vers ExploreMode en plein milieu de la validation.
  @override
  Transition<AppMode> onTap(TapGesture g) {
    return Transition.to<AppMode>(TripActiveMode(tripId));
  }
}
