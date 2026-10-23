part of 'map_objects.dart';

final class MapSegment extends MapObject implements Selectable {
  final SectionId id;
  final TripId tripId;
  const MapSegment({required this.id, required this.tripId});

  @override
  int get hitPriority => 50;

  @override
  bool operator ==(Object other) => other is MapSegment && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
