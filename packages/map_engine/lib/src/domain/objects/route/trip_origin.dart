part of "../map_objects.dart";

// part route/trip_origin.dart
/// Un point d'origine : avec route (MapTripOrigin) ou sans (MapTmpOrigin).
abstract interface class MapRouteOrigin implements MapObject {}

final class MapTripOrigin extends RouteElements implements MapRouteOrigin {
  final TripId tripId;
  MapTripOrigin(this.tripId);
  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}

final class MapTmpOrigin extends MapObject
    implements Selectable, MapRouteOrigin {
  MapTmpOrigin();
  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 200;

  @override
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
