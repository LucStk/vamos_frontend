import 'package:topology_application/patches/graph_patch_store.dart';
import 'package:topology_application/patches/vertex_patch.dart';
import 'package:topology_application/read_models/vertex_ui_model.dart';
import 'package:topology_engine/domain/entities/vertex.dart';
import 'package:topology_engine/graph/graph_store.dart';
import 'package:trip_domain/trip_domain.dart';

VertexUiModel vertexProject(
  Vertex? vertex,
  VertexPatch? vertexPatch,
  Waypoint? vertexWaypoint,
) {
  final position = vertexPatch?.positionOverride ?? .latLng;

  final Waypoint? waypoint = waypointStore.getFromVertex(id);

  return VertexUiModel(
    position: position,
    isOptimistic: patch != null,
    poiCategory: (waypoint != null) ? waypoint.poiCategory : null,
  );
}
