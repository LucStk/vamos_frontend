import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topology_application/read_models/vertex_ui_model.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/stores/graph_store.dart';
import 'package:vamos_cartographie/core/injection/stores/waypoint_store.dart';
part 'vertex_projections.g.dart';

@riverpod
VertexUiModel vertexUi(Ref ref, VertexId id) async {
  // regarde graphStore et PatchStore pour former le vertex demandé
  final graphStore = await ref.watch(vertexGraphStoreProvider.future);
  final patchStore = await ref.watch(vertexPatchStoreProvider.future);
  final waypointStore = ref.watch(waypointStoreProvider);
}
