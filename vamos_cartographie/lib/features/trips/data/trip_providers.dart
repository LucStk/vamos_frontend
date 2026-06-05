import "trip_remote_datasource.dart";
import "trip_repository.dart";
import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";

final tripRemoteDatasourceProvider = Provider<TripRemoteDatasource>((ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepository(ref.watch(tripRemoteDatasourceProvider));
});
