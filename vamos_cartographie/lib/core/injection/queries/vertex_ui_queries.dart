import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topology_application/topology_application.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/queries/graph_queries.dart';
import 'package:vamos_cartographie/core/injection/queries/trip_domain_queries.dart';
import 'package:vamos_cartographie/core/injection/stores/graph_store.dart';
import 'package:vamos_cartographie/features/topology/vertex_ui_model.dart';
part 'vertex_ui_queries.g.dart';

@riverpod
List<VertexUiId> vertexUiIds(Ref ref, SegmentId segId) {
  // Permets d'avoir tous les segment avec un granularité de rebuild à l'échelle du segment
  final vertexPatchIds =
      ref.watch(vertexPatchStoreProvider).getIds() as List<Id>;
  final vertexIds = ref.watch(vertexStoreProvider).getIds() as List<Id>;
  return vertexIds.toSet().union(vertexPatchIds.toSet()).toList()
      as List<VertexUiId>;
}

@riverpod
VertexUiModel? segmentUi(Ref ref, VertexUiId id) {
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
