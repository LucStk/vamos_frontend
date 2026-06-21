import 'package:topology_application/patches/patch_store.dart';
import 'package:topology_application/read_models/vertex_ui_model.dart';
import 'package:topology_engine/graph/graph_store.dart';

class VertexProjector {
  final GraphStore graph;
  final PatchStore patches;
  final WaypointStore waypointStore;
  VertexProjector({
    required this.graph,
    required this.patches,
    required this.waypointStore,
  });

  VertexUiModel project(VertexId id) {
    final vertex = graph.vertexStore.getRequired(id);
    final patch = patches.getVertex(id);

    final position = patch?.positionOverride ?? vertex.latLng;

    return VertexUiModel(position: position, isOptimistic: patch != null);
  }
}
