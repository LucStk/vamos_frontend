import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/queries/graph_queries.dart';
import 'package:vamos_cartographie/features/topology/domain/vertex_ui.dart';
import 'package:vamos_cartographie/core/injection/queries/trip_domain_queries.dart';
import 'package:vamos_cartographie/core/injection/stores/graph_store.dart';
part 'vertex_ui_queries.g.dart';

@riverpod
List<VertexRef> vertexRefs(Ref ref) {
  final Set<VertexRef> vertexPatchIds = ref
      .watch(vertexPatchStoreProvider)
      .getIds()
      .cast<VertexRef>()
      .toSet();
  final Set<VertexRef> vertexIds = ref
      .watch(vertexStoreProvider)
      .getIds()
      .cast<VertexRef>()
      .toSet();

  return vertexIds.union(vertexPatchIds).toList();
}

@riverpod
VertexUi? vertexUi(Ref ref, VertexRef id) {
  final VertexPatch? vPatch = ref.watch(
    vertexPatchProvider(id as VertexPatchId),
  );
  if (vPatch != null) {
    return vPatch.toUiModel(null);
  }

  final Vertex? v = ref.watch(vertexProvider(id as VertexId));
  if (v == null) {
    return null;
  }
  final Waypoint? w = ref.watch(waypointFromVertexProvider(v.id));
  return v.toUiModel(w?.poiCategory);
}
