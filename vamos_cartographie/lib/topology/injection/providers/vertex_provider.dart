import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/core.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
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
CollectionStore<Vertex> vertexStore(Ref ref) {
  final graphStore = ref.watch(rawGraphStoreProvider);
  return graphStore.vertexStore;
}
