import 'package:domain_core/domain_core.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/waypoint/waypoint.dart';
import '/map/map.dart';
import '/topology/injection/injection.dart';

part 'vertex_queries.g.dart';

@riverpod
GraphNode<Vertex> vertexNode(Ref ref, VertexId id) {
  final store = ref.watch(vertexStoreProvider);
  final node = store.getNode(id);
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "vertexNode", resourceId: "$id"),
    );
  }
  return node as GraphNode<Vertex>;
}

@riverpod
NodeState<Vertex> vertex(Ref ref, VertexId id) {
  final node = ref.watch(vertexNodeProvider(id));
  return node.current;
}

@riverpod
List<Vertex> allVertex(Ref ref) {
  // Attention, ne fait pas de watch sur les StateNode<Vertex>
  final store = ref.watch(vertexStoreProvider);
  return store.store.values.map((v) => v.current.displayValue).toList();
}

@riverpod
Waypoint? waypointFromVertex(Ref ref, VertexId vertexId) {
  final store = ref.watch(waypointStoreProvider);
  return store.getFromVertex(vertexId);
}

@riverpod
bool isVertexSelected(Ref ref, TripId tripId, VertexId vertexId) {
  final mapState = ref.watch(mapStateProvider(tripId));
  return switch (mapState.selection) {
    VertexSelection e => (vertexId == e.vertexId),
    _ => false,
  };
}
