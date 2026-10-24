part of "../app_mode.dart";

// mode just après avoir créé un trip pour poser le premier point
final class CreateTripMode extends PlaceOriginTripMode {
  const CreateTripMode();
  static Transition<AppMode> switchTo() => Transition.to(CreateTripMode());
}
