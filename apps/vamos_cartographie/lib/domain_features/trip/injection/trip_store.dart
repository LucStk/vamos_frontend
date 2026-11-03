import "package:domain_core/domain_core.dart";
import "package:riverpod/riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";
import "package:vamos_cartographie/core/injection/error_logger.dart";
import "package:vamos_cartographie/core/injection/mutation_queue_provider.dart";
import "package:vamos_cartographie/domain_features/auth/providers/providers.dart";
import "package:vamos_cartographie/domain_features/stored_file/injection/injection.dart";
import "package:vamos_cartographie/domain_features/trip/data/trip_remote_datasource.dart";
import "package:vamos_cartographie/domain_features/trip/data/trip_repository_impl.dart";

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

@Riverpod(keepAlive: true)
Trip? trip(Ref ref, TripId tripId) {
  return ref.watch(tripStoreProvider).tripStore.get(tripId);
}

@Riverpod(keepAlive: true)
Trip tripRequired(Ref ref, TripId tripId) =>
    ref.watch(tripStoreProvider).tripStore.getRequired(tripId);

@riverpod
List<TripId> tripIds(Ref ref) {
  final store = ref.watch(tripStoreProvider);
  return store.tripStore.getIds();
}

@Riverpod(keepAlive: true)
bool isTripOwned(Ref ref, TripId tripId) {
  final userId = ref.watch(currentUserIdProvider);
  final ownerId = ref.watch(tripProvider(tripId).select((t) => t?.ownerId));
  return userId != null && ownerId != null && ownerId.value == userId;
}

@Riverpod(keepAlive: true)
TripSummary tripSummary(Ref ref, TripId tripId) {
  return TripSummary(
    trip: ref.watch(tripRequiredProvider(tripId)),
    storedFiles: ref.watch(tripImagesProvider(tripId)),
  );
}
