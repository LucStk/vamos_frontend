import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class TripEditMode extends TripMode {
  const TripEditMode(super.tripId);
  @override
  Transition<AppMode> onTap(TapGesture g) {
    if (g.hit != null) {
      return Transition.overlay<AppMode>(MapObjectMenu(g.hit!));
    }
    return Transition.stay();
  }

  @override
  Transition<AppMode> onLongPress(LongPressGesture g) => switch (g.hit) {
    _ => Transition.overlay(MapGeoMenu(g.world)),
  };
  @override
  Transition<AppMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(MapGeoMenu(g.world)),
      };
}
