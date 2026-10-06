import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";

import "/core/injection/error_logger.dart";
import "/core/injection/mutation_queue_provider.dart";
import "/core/injection/client_provider.dart";
import "../data/trip_remote_datasource.dart";
import "../data/trip_repository_impl.dart";
part "trip_store.g.dart";

@Riverpod(keepAlive: true)
TripRemoteDatasource tripRemoteDatasource(Ref ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
}

@Riverpod(keepAlive: true)
TripRepository tripRepository(Ref ref) {
  return TripRepositoryImpl(ref.watch(tripRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
class TripStoreNotifier extends _$TripStoreNotifier
    with OptimisticRunner<TripStore>, TripEditor {
  @override
  TripStore build() => TripStore.initial();

  @override
  TripRepository get tripRepo => ref.read(tripRepositoryProvider);

  @override
  MutationQueue get mutationQueue => ref.read(mutationQueueProvider);

  @override
  ErrorLogger? get errorLogger => ref.read(errorLoggerProvider);
  void emit(TripStore newStoredFileStore) {
    state = newStoredFileStore;
  }
}

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  return ref.watch(tripStoreProvider).tripStore.get(tripId);
}

@riverpod
Trip tripRequired(Ref ref, TripId tripId) {
  final trip = ref.watch(tripStoreProvider).tripStore.get(tripId);
  if (trip == null) {
    throw NotFoundFailure(resourceId: tripId.value, resourceType: "trip");
  }
  return trip;
}

@riverpod
List<TripId> tripIds(Ref ref) {
  final store = ref.watch(tripStoreProvider);
  return store.tripStore.getIds();
}
