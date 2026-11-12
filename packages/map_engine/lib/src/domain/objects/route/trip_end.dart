import 'package:map_engine/src/domain/objects/route/route_elements.dart';
import 'package:trip_application/trip_application.dart';

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
