import 'package:riverpod/riverpod.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/topology/application/providers/vertex_notifier.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

// class TopologySyncService {
//   TopologySyncService(this.ref);

//   final Ref ref;

//   void applyWaypointCreated({
//     required int tripId,
//     required Waypoint waypoint,
//     Vertex? vertex,
//   }) {
//     final waypoints = ref.read(waypointsProvider(tripId).notifier);

//     // waypoints.addLocal(waypoint);

//     if (vertex != null) {
//       ref.read(verticesProvider(tripId).notifier).upsert(vertex);
//     }
//   }

//   void applyVertexCreated(Vertex vertex, int tripId) {
//     ref.read(verticesProvider(tripId).notifier).upsert(vertex);
//   }
// }
