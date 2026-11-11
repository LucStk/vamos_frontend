part of "../map_objects.dart";

final class MapTripEnd extends RouteElements {
  final TripId tripId;
  MapTripEnd(this.tripId);

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapTripEnd;
  @override
  int get hashCode => (MapTripEnd).hashCode;
}
