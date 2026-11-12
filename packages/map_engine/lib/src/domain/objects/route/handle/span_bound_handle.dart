// SelectionHandle : ajoute `implements PolylineHandle`.

import 'package:map_engine/src/domain/objects/objects.dart';
import 'package:map_engine/src/modes/edit_route/slots/span_bounds_slot.dart';
import 'package:trip_application/trip_application.dart';

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
