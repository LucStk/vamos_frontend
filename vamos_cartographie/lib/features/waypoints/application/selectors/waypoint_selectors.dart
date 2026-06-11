import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/graph_providers.dart';

// @riverpod
// Iterable<int> waypointIds(Ref ref) {
//   return ref.watch(waypointsProvider).keys;
// }

// @riverpod
// Waypoint? waypointById(Ref ref, int id) {
//   final graph = ref.watch(graphStoreProvider);

//   return graph.map<Waypoint>()[id]?.value;
// }
// @riverpod
// Map<int, Waypoint> waypointsByVertex(Ref ref) {
//   final waypoints = ref.watch(waypointsProvider);

//   return {for (final w in waypoints.values) w.vertexId: w};
// }
