import 'package:domain_core/domain_core.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/topology/topology.dart';

part 'vertex_queries.g.dart';

@Riverpod(keepAlive: true)
GraphNode<WaypointFields> vertexNode(Ref ref, TripId tripId, WaypointId id) {
  final node = ref.watch(vertexStoreProvider(tripId).select((s) => s.get(id)));
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "vertexNode", resourceId: "$id"),
    );
  }
  return node;
}

@Riverpod(keepAlive: true)
WaypointFields waypoint(Ref ref, TripId tripId, WaypointId id) {
  return ref.watch(vertexNodeProvider(tripId, id).select((e) => e.current));
}

@Riverpod(keepAlive: true)
List<WaypointFields> allVertex(Ref ref, TripId tripId) {
  // Attention, ne fait pas de watch sur les StateNode<Vertex>
  final store = ref.watch(vertexStoreProvider(tripId));
  return store.store.values.map((v) => v.current).toList();
}

@Riverpod(keepAlive: true)
List<WaypointId> allVertexIds(Ref ref, TripId tripId) {
  // Attention, ne fait pas de watch sur les StateNode<Vertex>
  final store = ref.watch(vertexStoreProvider(tripId));
  return store.store.values.map((v) => v.id).toList();
}

@Riverpod(keepAlive: true)
WaypointId? waypointFromVertex(Ref ref, TripId tripId, WaypointId vertexId) {
  return ref.watch(
    waypointStoreProvider(tripId).select((s) => s.getFromVertex(vertexId)),
  );
}

// @riverpod
// bool isVertexSelected(Ref ref, TripId tripId, WaypointId vertexId) {
//   return ref.watch(
//     mapStateProvider(tripId).select((s) {
//       return switch (s.selection) {
//         MapWaypoint e => (vertexId == e.waypoint.id),
//         _ => false,
//       };
//     }),
//   );
// }
