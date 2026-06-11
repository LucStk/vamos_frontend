import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';

class WaypointOptimisticService {
  final GraphStore graph;

  WaypointOptimisticService(this.graph);

  Future<int> applyCreateWaypointTx({
    required int txId,
    required WaypointDraft draft,
    required LatLng? latLng,
  }) async {
    final waypointTempId = nextTempId();

    int vertexId;

    // 1. vertex existant
    if (latLng == null) {
      throw Exception("latLng required if no vertexId provided");
    }

    // 2. créer vertex optimiste
    final vertexTempId = nextTempId();

    _map<Vertex>()[vertexTempId] = _Node<Vertex>(
      Vertex(id: vertexTempId, latLng: latLng),
    );

    // 3. créer waypoint optimiste lié au vertex temp
    _map<Waypoint>()[waypointTempId] = _Node<Waypoint>(
      Waypoint(
        id: waypointTempId,
        vertexId: vertexTempId,
        title: draft.title,
        type: draft.type,
        description: draft.description,
        images: draft.images,
      ),
    );

    return waypointTempId;
  }

  void commitCreate(
    int waypointTempId,
    int vertexTempId,
    Waypoint serverWaypoint,
    Vertex serverVertex,
  ) {
    graph.delete<Waypoint>(waypointTempId);
    graph.delete<Vertex>(vertexTempId);

    graph.create<Vertex>(serverVertex.id, serverVertex);

    graph.create<Waypoint>(
      serverWaypoint.id,
      serverWaypoint.copyWith(vertexId: serverVertex.id),
    );
  }
}
