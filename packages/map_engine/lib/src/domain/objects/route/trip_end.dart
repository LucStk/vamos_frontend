part of "../map_objects.dart";

final class MapTripEnd extends RouteElements {
  final TripId tripId;
  MapTripEnd(this.tripId);

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
