import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/waypoint/waypoint.dart';

part 'waypoint_queries.g.dart';

@riverpod
GraphNode<WaypointFields> waypointNode(Ref ref, TripId tripId, WaypointId id) {
  final store = ref.watch(waypointStoreProvider(tripId));
  final node = store.waypointStore.store[id];
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "WaypointNode", resourceId: "$id"),
    );
  }
  return node;
}

@riverpod
WaypointFields waypoint(Ref ref, TripId tripId, WaypointId id) {
  final node = ref.watch(waypointNodeProvider(tripId, id));
  return node.current;
}

@riverpod
List<WaypointFields> allWaypoint(Ref ref, TripId tripId) {
  // Attention, ne fait pas de watch sur les StateNode<Vertex>
  final store = ref.watch(waypointStoreProvider(tripId));
  return store.waypointStore.store.values.map((v) => v.current).toList();
}
