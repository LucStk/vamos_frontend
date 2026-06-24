import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topology_application/topology_application.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/queries/graph_queries.dart';
import 'package:vamos_cartographie/core/injection/queries/waypoint_queries.dart';
import 'package:vamos_cartographie/core/injection/stores/graph_store.dart';
part 'vertex_ui_queries.g.dart';

@riverpod
Map<Id, VertexUiModel> verticesUi(Ref ref, TripId tripId, SegmentId segId) {
  // Permets d'avoir tous les segment avec un granularité de rebuild à l'échelle du segment
  final vertexStore = ref.watch(vertexStoreProvider);
  final patchStore = ref.watch(vertexPatchStoreProvider);
  final Map<Id, VertexUiModel> r = {};
  final vertexPatchIds = patchStore.getIds() as List<Id>;
  final vertexIds = vertexStore.getIds() as List<Id>;
  final onlyInVertexIds =
      vertexIds.toSet().difference(vertexPatchIds.toSet()).toList()
          as List<VertexId>;

  for (Id<Vertex> id in onlyInVertexIds) {
    final v = ref.watch(vertexProvider(id));
    // On va chercher si il y a un waypoint associé
    final Waypoint? w = ref.watch(waypointFromVertexProvider(id));
    if (v == null) continue;
    final vUi = v.toUiModel(w?.poiCategory);
    r[vUi.id] = vUi;
  }
  for (Id<VertexPatch> id in (vertexPatchIds as List<Id<VertexPatch>>)) {
    final v = ref.watch(vertexPatchProvider(id));
    if (v == null) continue;
    final vUi = v.toUiModel(null);
    r[vUi.id] = vUi;
  }
  return r;
}
