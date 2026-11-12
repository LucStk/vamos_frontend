import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/injection/client_provider.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/geosearch_remote_datasource.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/geosearch_repository_impl.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/geosearch_repository.dart';

part 'geosearch_providers.g.dart';

// Suppose que clientProvider expose directement le Client Ferry (comme pour
// waypoint/trip). S'il est asynchrone, awaitez-le ici.
@riverpod
GeosearchRepository geosearchRepository(Ref ref) {
  final client = ref.watch(clientProvider);
  return GeosearchRepositoryImpl(GeosearchRemoteDatasource(client));
}
