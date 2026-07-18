import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:stored_file_application/stored_file_application.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/stored_file/injection/injection.dart";
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

  @override
  TripRepository get tripRepo => ref.read(tripRepositoryProvider);

  @override
  MutationQueue get mutationQueue => ref.read(mutationQueueProvider);

  @override
  ErrorLogger? get errorLogger => null;

  Future<Failure?> loadTrips() async {
    final res = await tripRepo.getAllTrips();

    return res.fold((Failure f) => f, (data) {
      var newStore = TripStore.initial();
      var newFileStore = StoredFileStore.initial();
      for (final (trip, listImages) in data) {
        newStore = newStore.insertTrip(trip);
        for (final i in listImages) {
          newFileStore = newFileStore.insertStoredFile(trip.id, i);
        }
      }
      state = newStore; // met bien à jour tripStoreProvider

      final mediaStore = ref.read(storedFileStoreProvider.notifier);
      mediaStore.state = newFileStore;
      return null;
    });
  }
}
