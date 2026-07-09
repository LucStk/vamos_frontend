import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/core/services/add_listener_to_observable.dart";
import "package:vamos_cartographie/topology/data/datasources/vertex_remote_datasource.dart";
import "package:vamos_cartographie/topology/data/repositories/vertex_repository_impl.dart";
import "package:vamos_cartographie/topology/injection/injection.dart";
part "vertex_provider.g.dart";

@riverpod
VertexRemoteDatasource vertexRemoteDatasource(Ref ref) {
  return VertexRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
VertexRepository vertexRepository(Ref ref) {
  return VertexRepositoryImpl(ref.watch(vertexRemoteDatasourceProvider));
}

@riverpod
ObservableCollectionStore<Vertex> vertexStore(Ref ref) {
  final graphStore = ref.watch(rawGraphStoreProvider);

  // debugPrint("vertexStore rebuild");
  addListenerRebuild(ref, graphStore.vertexStore);
  return graphStore.vertexStore;
}

@riverpod
ObservableCollectionStore<VertexPatch> vertexPatchStore(Ref ref) {
  final graphStore = ref.watch(rawGraphPatchStoreProvider);
  addListenerRebuild(ref, graphStore.vertexPatchStore);
  return graphStore.vertexPatchStore;
}
