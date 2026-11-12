import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:trip_application/trip_application.dart';

final class MapWaypoint extends MapObject implements Selectable {
  final WaypointId id;
  final TripId tripId;
  const MapWaypoint({required this.id, required this.tripId});

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapWaypoint && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

final class MapPendingWaypoint extends MapObject implements Selectable {
  final TripId tripId;
  const MapPendingWaypoint({required this.tripId});

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) => other is MapPendingWaypoint;

  @override
  int get hashCode => (MapPendingWaypoint).hashCode;
}

final class MapWaypointAnchor extends MapObject {
  final TripId tripId;
  final WaypointId waypointId;
  const MapWaypointAnchor({required this.tripId, required this.waypointId});

  @override
  bool get isDraggable => true;

  @override
  bool operator ==(Object other) =>
      other is MapWaypointAnchor &&
      other.waypointId == waypointId &&
      other.tripId == tripId;

  @override
  int get hashCode => Object.hash(tripId, waypointId, MapWaypointAnchor);
}

final class MapChainWaypoint extends MapObject {
  final TripId tripId;
  final WaypointId waypointId;
  const MapChainWaypoint({required this.tripId, required this.waypointId});

  @override
  bool get isDraggable => false;
  @override
  bool get isHitTestable => false;
  @override
  bool operator ==(Object other) =>
      other is MapChainWaypoint &&
      other.waypointId == waypointId &&
      other.tripId == tripId;

  @override
  int get hashCode => Object.hash(tripId, waypointId, MapChainWaypoint);
}
