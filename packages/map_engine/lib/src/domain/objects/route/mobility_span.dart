part of '../map_objects.dart';

final class MapMobilitySpan extends RouteElements {
  final MobilitySpanId id;
  final int spanStartIndex;
  final TripId tripId;
  MapMobilitySpan({
    required this.id,
    required this.tripId,
    required this.spanStartIndex,
  });

  @override
  int get hitPriority => 50;

  @override
  bool operator ==(Object other) => other is MapMobilitySpan && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
