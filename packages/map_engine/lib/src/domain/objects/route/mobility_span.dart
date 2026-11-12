import 'package:map_engine/src/domain/objects/route/route_elements.dart';
import 'package:trip_application/trip_application.dart';

final class MapMobilitySpan extends RouteElements {
  final MobilitySpanId id;
  final double start;
  final double end;
  final TripId tripId;
  MapMobilitySpan({
    required this.id,
    required this.tripId,
    required this.start,
    required this.end,
  });
  // ...
  @override
  bool get isDraggable => true;

  @override
  bool get isMovedByDrag => false; // la route ne suit pas le doigt

  @override
  bool operator ==(Object other) => other is MapMobilitySpan && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
