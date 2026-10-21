part of "../app_mode.dart";

sealed class TripEditableMode extends TripMode {
  const TripEditableMode(super.tripId);
}

final class TripActiveMode extends TripEditableMode {
  const TripActiveMode(super.tripId);

  @override
  Transition<AppMode> onLongPress(LongPressGesture g) => switch (g.element) {
    _ => Transition.overlay(MapPointMenu(g.world)),
  };
  @override
  Transition<AppMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(MapPointMenu(g.world)),
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

// mode just après avoir créé un trip pour poser le premier point
final class SetTripOriginMode extends TripEditableMode {
  const SetTripOriginMode(super.tripId);
  @override
  Transition<AppMode> onLongPress(LongPressGesture g) => Transition.stay();
  @override
  Transition<AppMode> onSecondaryTap(SecondaryTapGesture g) =>
      Transition.stay();

  @override
  Transition<AppMode> onTap(TapGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));
}
