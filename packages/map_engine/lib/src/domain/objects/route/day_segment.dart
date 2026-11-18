import 'package:map_engine/src/domain/objects/route/route_elements.dart';
import 'package:trip_application/trip_application.dart';

/// Un jour sur la carte (à placer dans map_engine, comme MapMobilitySpan).
final class MapDaySegment extends RouteElements {
  /// Halte qui termine le jour ; null pour la dernière journée.
  final WaypointId? endsAt;
  final TripId tripId;
  MapDaySegment({required this.endsAt, required this.tripId});

  @override
  bool get isDraggable => true;

  @override
  bool get isMovedByDrag => false;

  @override
  bool operator ==(Object other) =>
      other is MapDaySegment && other.endsAt == endsAt;
  @override
  int get hashCode => endsAt.hashCode;
}
