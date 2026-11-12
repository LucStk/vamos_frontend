part of '../../map_objects.dart';

// SelectionHandle : ajoute `implements PolylineHandle`.

final class SpanBoundHandle extends RouteHandle {
  const SpanBoundHandle({
    required this.tripId,
    required this.spanId,
    required this.bound,
  });
  final TripId tripId;
  final MobilitySpanId spanId;
  final SpanBound bound;

  @override
  bool operator ==(Object other) =>
      other is SpanBoundHandle &&
      other.tripId == tripId &&
      other.spanId == spanId;

  @override
  int get hashCode => Object.hash(tripId, spanId);
}
