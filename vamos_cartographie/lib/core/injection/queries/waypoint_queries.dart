import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/stores/waypoint_store.dart';

import 'package:trip_domain/trip_domain.dart';
part 'waypoint_queries.g.dart';

@riverpod
Waypoint? waypoint(Ref ref, WaypointId id) {
  final asyncWaypoint = ref.watch(waypointStoreProvider);
  return asyncWaypoint.value?[id];
}

@riverpod
Waypoint? waypointFromVertex(Ref ref, VertexId vertexId) {
  final store = ref.watch(rawWaypointStoreProvider);
  // On s'abonne au stream pour les rebuilds
  ref.watch(waypointStoreProvider);
  return store.getFromVertex(vertexId);
}
