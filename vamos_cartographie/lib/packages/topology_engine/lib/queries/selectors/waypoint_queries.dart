import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:topology_engine/queries/selectors/graph_selectors.dart';

part 'waypoint_queries.g.dart';

/// ======================================================
/// COLLECTION
/// ======================================================

@riverpod
Vertex waypointVertex(Ref ref, Id<Trip> tripId, Id<Waypoint> waypointId) {
  final Waypoint waypoint = ref.watch(
    nodeRequiredProvider<Waypoint>(tripId, waypointId),
  );
  final Vertex vertex = ref.watch(
    nodeRequiredProvider<Vertex>(tripId, waypoint.vertexId),
  );

  return vertex;
}
