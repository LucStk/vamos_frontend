part of "../app_mode.dart";

sealed class TripEditMode extends AppMode {
  const TripEditMode(this.tripId);
  final TripId tripId;
}
