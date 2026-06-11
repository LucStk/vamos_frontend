// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/topology/data/data.dart';
import "package:vamos_cartographie/core/injection/client_provider.dart";
part 'vertex_providers.g.dart';

@riverpod
VertexRemoteDatasource vertexRemoteDatasource(Ref ref) {
  return VertexRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
VertexRepository vertexRepository(Ref ref) {
  return VertexRepository(ref.watch(vertexRemoteDatasourceProvider));
}
