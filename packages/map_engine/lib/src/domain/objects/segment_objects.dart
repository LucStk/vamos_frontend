part of 'map_objects.dart';

final class MapSegment extends MapObject implements Selectable, TopologyObject {
  final SectionId id;
  final TripId tripId;
  const MapSegment({required this.id, required this.tripId});

  @override
  SpliceAnchor get anchor => SegmentAnchor(id);

  @override
  int get hitPriority => 50;

  @override
  bool operator ==(Object other) => other is MapSegment && other.id == id;
  @override
  int get hashCode => id.hashCode;
}

final class MapTripStart extends MapObject implements Selectable {
  const MapTripStart();

  @override
  bool get isDraggable => false;

  @override
  int get hitPriority => 50;

  @override
  bool operator ==(Object other) => other is MapTripStart;
  @override
  int get hashCode => (MapTripStart).hashCode;
}

final class MapSegmentEndPoint extends MapObject implements Selectable {
  const MapSegmentEndPoint(this.id);
  final SectionId id;

  @override
  int get hitPriority => 50;

  @override
  bool operator ==(Object other) =>
      other is MapSegmentEndPoint && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
