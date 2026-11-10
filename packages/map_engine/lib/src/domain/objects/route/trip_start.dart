part of "../map_objects.dart";

// part route/trip_start.dart
/// Un point d'origine : avec route (MapTripStart) ou sans (MapTmpOrigin).
abstract interface class MapRouteOrigin implements MapObject {}

final class MapTripStart extends RouteElements implements MapRouteOrigin {
  final TripId tripId;
  MapTripStart(this.tripId);
  @override
  bool get isDraggable => true;

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
  bool operator ==(Object other) => other is MapLocalization;
  @override
  int get hashCode => (MapLocalization).hashCode;
}
