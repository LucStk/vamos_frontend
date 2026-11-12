import 'package:map_engine/src/domain/objects/objects.dart';
import 'package:map_engine/src/domain/objects/route/route_elements.dart';
import 'package:trip_application/trip_application.dart';

/// Un point d'origine : avec route (MapTripStart) ou sans (MapTmpOrigin).
abstract interface class MapRouteOrigin implements MapObject {}

final class MapTripStart extends RouteElements implements MapRouteOrigin {
  final TripId tripId;
  MapTripStart(this.tripId);
  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapTripStart;
  @override
  int get hashCode => (MapTripStart).hashCode;
}

final class MapTmpOrigin extends MapObject
    implements Selectable, MapRouteOrigin {
  MapTmpOrigin();
  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapTmpOrigin;
  @override
  int get hashCode => (MapTmpOrigin).hashCode;
}
