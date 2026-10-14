part of 'map_objects.dart';

final class MapVertex extends MapObject implements TopologyObject, Selectable {
  final VertexId id;
  final TripId tripId;
  const MapVertex({required this.id, required this.tripId});

  @override
  SpliceAnchor get anchor => VertexAnchor(id);

  @override
  bool get isDraggable => true;

  @override
  int get hitPriority => 100;

  @override
  bool operator ==(Object other) => other is MapVertex && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
