part of "map_objects.dart";

sealed class MapRouteOrigin extends MapObject implements Selectable {
  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}

final class MapTripOrigin extends MapRouteOrigin {
  final TripId tripId;
  MapTripOrigin(this.tripId);
}

final class MapTmpOrigin extends MapRouteOrigin {
  MapTmpOrigin();
}
