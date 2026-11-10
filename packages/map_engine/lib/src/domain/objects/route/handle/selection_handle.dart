part of '../../map_objects.dart';

final class SelectionHandle extends RouteHandle {
  SelectionHandle({required this.tripId, required this.id});

  final TripId tripId;
  final HandleId id;

  @override
  int get hitPriority => 50;

  @override
  final bool isDraggable = true;

  @override
  bool operator ==(Object other) =>
      other is SelectionHandle && other.tripId == tripId && other.id == id;

  @override
  int get hashCode => Object.hash(tripId, id);
}
