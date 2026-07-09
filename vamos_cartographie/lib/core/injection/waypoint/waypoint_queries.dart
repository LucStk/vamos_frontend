import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'waypoint_store.dart';

part 'waypoint_queries.g.dart';

@riverpod
Waypoint? waypointUi(Ref ref, WaypointId id) {
  final waypointStore = ref.watch(waypointStoreProvider);
  return waypointStore.get(id);
}

@riverpod
Waypoint? waypointFromVertex(Ref ref, VertexId vertexId) {
  final store = ref.watch(waypointStoreProvider);
  return store.getFromVertex(vertexId);
}
