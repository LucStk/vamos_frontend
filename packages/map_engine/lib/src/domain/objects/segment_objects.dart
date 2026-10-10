part of 'map_objects.dart';

final class MapSegment extends MapLine implements TopologyObject {
  final SegmentId id;
  const MapSegment(this.id, super.geometry);

  @override
  SpliceAnchor get anchor => SegmentAnchor(id);

  @override
  double get radius => 10;

  @override
  int get hitPriority => 50;

  @override
  bool isSameAs(MapObject? other) => other is MapSegment && other.id == id;
}

final class MapTripStart extends MapPoint {
  const MapTripStart(super.position);

  @override
  bool get isDraggable => false;

  @override
  double get radius => 10;

  @override
  int get hitPriority => 50;

  @override
  bool isSameAs(MapObject? other) => other is MapTripStart;
}

final class MapSegmentEndPoint extends MapPoint {
  const MapSegmentEndPoint(this.id, super.position);
  final SegmentId id;

  @override
  double get radius => 10;

  @override
  int get hitPriority => 50;

  @override
  bool isSameAs(MapObject? other) =>
      other is MapSegmentEndPoint && other.id == id;
}
