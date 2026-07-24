import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/waypoint/waypoint.dart';
import '/map/map.dart';
import '/topology/injection/injection.dart';

part 'vertex_queries.g.dart';

@riverpod
GraphNode<VertexFields> vertexNode(Ref ref, TripId tripId, VertexId id) {
  final node = ref.watch(vertexStoreProvider(tripId).select((s) => s.get(id)));
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "vertexNode", resourceId: "$id"),
    );
  }
  return node;
}

@riverpod
VertexFields vertex(Ref ref, TripId tripId, VertexId id) {
  return ref.watch(vertexNodeProvider(tripId, id).select((e) => e.current));
}

@riverpod
List<VertexFields> allVertex(Ref ref, TripId tripId) {
  // Attention, ne fait pas de watch sur les StateNode<Vertex>
  final store = ref.watch(vertexStoreProvider(tripId));
  return store.store.values.map((v) => v.current).toList();
}

@riverpod
WaypointId? waypointFromVertex(Ref ref, TripId tripId, VertexId vertexId) {
  return ref.watch(
    waypointStoreProvider(tripId).select((s) => s.getFromVertex(vertexId)),
  );
}

@riverpod
bool isVertexSelected(Ref ref, TripId tripId, VertexId vertexId) {
  return ref.watch(
    mapStateProvider(tripId).select((s) {
      return switch (s.selection) {
        VertexSelection e => (vertexId == e.vertexId),
        _ => false,
      };
    }),
  );
}
