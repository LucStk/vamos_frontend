import 'package:map_engine/src/domain/objects/route/route_elements.dart';
import 'package:trip_application/trip_application.dart';

/// Un jour sur la carte (à placer dans map_engine, comme MapMobilitySpan).
final class MapDaySegment extends RouteElements {
  final SpanId id;
  final TripId tripId;
  MapDaySegment({required this.id, required this.tripId});

  @override
  bool get isDraggable => true;

  @override
  bool get isMovedByDrag => false;

  @override
  bool operator ==(Object other) => other is MapDaySegment && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
