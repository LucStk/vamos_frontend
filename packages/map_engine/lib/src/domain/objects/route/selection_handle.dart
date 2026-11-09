part of '../map_objects.dart';

enum HandleSide { start, end }

final class SelectionHandle extends MapObject implements Selectable {
  SelectionHandle({required this.tripId, required this.side});

  final TripId tripId;
  final HandleSide side;

  @override
  int get hitPriority => 50;

  @override
  bool operator ==(Object other) =>
      other is SelectionHandle && other.tripId == tripId && other.side == side;

  @override
  int get hashCode => Object.hash(tripId, side);
}
