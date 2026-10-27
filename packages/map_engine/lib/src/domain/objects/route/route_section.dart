part of '../map_objects.dart';

final class MapSection extends MapObject implements Selectable {
  final SectionId id;
  final TripId tripId;
  const MapSection({required this.id, required this.tripId});

  @override
  int get hitPriority => 50;

  @override
  bool operator ==(Object other) => other is MapSection && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
