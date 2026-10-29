import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class TripEditMode extends TripMode {
  const TripEditMode(super.tripId);
  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapTripOrigin _ => Transition.overlay<AppMode>(TripOriginMenu()),
    MapTripEnd _ => Transition.overlay<AppMode>(TripEndMenu(tripId)),
    MapSection s => Transition.overlay<AppMode>(
      SectionMenu(tripId: tripId, sectionId: s.id, at: g.world),
    ),
    _ => Transition.stay(),
  };

  @override
  Transition<AppMode> onLongPress(LongPressGesture g) => switch (g.element) {
    _ => Transition.overlay(MapPointMenu(tripId: tripId, position: g.world)),
  };
  @override
  Transition<AppMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(
          MapPointMenu(tripId: tripId, position: g.world),
        ),
      };
}
