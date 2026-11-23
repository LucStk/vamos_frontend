import 'package:map_engine/src/domain/objects/route/route_elements.dart';
import 'package:trip_application/trip_application.dart';

/// Un morceau de journée sur la carte : la partie d'un jour parcourue dans un
/// span de mobilité. On y entre depuis un jour sélectionné (`MapDaySegment`).
final class MapDayRun extends RouteElements {
  MapDayRun({required this.tripId, required this.endsAt, required this.spanId});

  final TripId tripId;

  /// Halte qui termine le jour ; null pour la dernière journée.
  final WaypointId? endsAt;

  /// Span de mobilité du morceau.
  final SpanId spanId;

  @override
  bool operator ==(Object other) =>
      other is MapDayRun &&
      other.tripId == tripId &&
      other.endsAt == endsAt &&
      other.spanId == spanId;

  @override
  int get hashCode => Object.hash(tripId, endsAt, spanId);
}
