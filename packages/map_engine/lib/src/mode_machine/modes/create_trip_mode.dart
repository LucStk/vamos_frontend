part of "../app_mode.dart";

// mode just après avoir créé un trip pour poser le premier point
final class CreateTripMode extends AppMode {
  const CreateTripMode();
  @override
  Transition<AppMode> onLongPress(LongPressGesture g) => Transition.stay();
  @override
  Transition<AppMode> onSecondaryTap(SecondaryTapGesture g) =>
      Transition.stay();

  @override
  Transition<AppMode> onTap(TapGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

  static Transition<AppMode> switchTo(TripId tripId) =>
      Transition.to(CreateTripMode());
}
