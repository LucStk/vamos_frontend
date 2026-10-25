import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/map_point_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/origin_menu.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

abstract class TripEditableMode extends TripMode {
  const TripEditableMode(super.tripId);
}

final class TripActiveMode extends TripEditableMode {
  const TripActiveMode(super.tripId);
  @override
  Transition<AppMode> onTap(TapGesture g) {
    if (g.element is MapTripOrigin) {
      return Transition.overlay<AppMode>(TripOriginMenu(tripId));
    }
    return Transition.stay();
  }

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
  static Transition<AppMode> switchTo(TripId tripId) =>
      Transition.to(TripActiveMode(tripId));
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
