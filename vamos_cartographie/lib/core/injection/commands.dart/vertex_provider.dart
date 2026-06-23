// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "/core/injection/client_provider.dart";
import '/infrastructure/topology/datasources/vertex_remote_datasource.dart';
import '/infrastructure/topology/repositories/vertex_repository.dart';
part 'vertex_provider.g.dart';

@riverpod
VertexRemoteDatasource vertexRemoteDatasource(Ref ref) {
  return VertexRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
VertexRepository vertexRepository(Ref ref) {
  return VertexRepository(ref.watch(vertexRemoteDatasourceProvider));
}
