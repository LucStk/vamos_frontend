import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "/trip/data/data.dart";
part "trip_store.g.dart";

@riverpod
TripRemoteDatasource tripRemoteDatasource(Ref ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TripRepository tripRepository(Ref ref) {
  return TripRepositoryImpl(ref.watch(tripRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
class TripStoreNotifier extends _$TripStoreNotifier
    with OptimisticRunner<TripStore>, TripEditor {
  @override
  TripStore build() => TripStore.initial();

  // Injection des dépendances requises par le mixin TopologyHandler
  @override
  TripRepository get tripRepo => ref.read(tripRepositoryProvider);

  @override
  ErrorLogger? get errorLogger => null;
}
