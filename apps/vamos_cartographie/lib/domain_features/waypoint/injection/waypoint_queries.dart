import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';

part 'waypoint_queries.g.dart';

@Riverpod(keepAlive: true)
GraphNode<WaypointFields> waypointNode(Ref ref, TripId tripId, WaypointId id) {
  final node = ref.watch(
    waypointStoreProvider(tripId).select((s) => s.waypointStore.get(id)),
  );
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "WaypointNode", resourceId: "$id"),
    );
  }
  return node;
}

@Riverpod(keepAlive: true)
WaypointFields waypoint(Ref ref, TripId tripId, WaypointId id) {
  return ref.watch(waypointNodeProvider(tripId, id).select((s) => s.current));
}

@riverpod
List<WaypointId> allWaypointIds(Ref ref, TripId tripId) {
  // Attention, ne fait pas de watch sur les StateNode<Vertex>
  return ref.watch(
    waypointStoreProvider(tripId).select((s) => s.waypointStore.getIds()),
  );
}
