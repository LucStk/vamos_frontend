part of "../app_mode.dart";

final class TripEditMode extends TripMode {
  const TripEditMode(super.tripId);

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
final class TripValidatingMode extends TripMode {
  const TripValidatingMode(super.tripId);

  // Pas de onLongPress / onSecondaryTap : l'édition est impossible.

  // Surcharge indispensable : le tap dans le vide de TripMode
  // sortirait vers ExploreMode en plein milieu de la validation.
  @override
  Transition<AppMode> onTap(TapGesture g) {
    return Transition.to<AppMode>(TripEditMode(tripId));
  }
}
