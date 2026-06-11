import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/features.dart';

// @riverpod
// Map<int, Waypoint> waypoints(Ref ref) {
//   final graph = ref.watch(graphStoreProvider);

//   return graph.getAll<Waypoint>();
// }

// @riverpod
// Iterable<int> waypointIds(Ref ref) {
//   return ref.watch(waypointsProvider).keys;
// }

// @riverpod
// Waypoint? waypointById(Ref ref, int waypointId) {
//   final graph = ref.watch(graphStoreProvider);

//   return graph.get<Waypoint>(waypointId);
// }

// @riverpod
// Map<int, Waypoint> waypointsByVertex(Ref ref) {
//   final waypoints = ref.watch(waypointsProvider);

//   return {for (final w in waypoints.values) w.vertexId: w};
// }
