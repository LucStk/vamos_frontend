import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/graph/application/graph_executor.dart';
import 'package:vamos_cartographie/features/graph/application/graph_providers.dart';
import 'package:vamos_cartographie/features/graph/store/entity_store.dart';
import "package:vamos_cartographie/features/trips/domain/trip.dart";
import 'package:vamos_cartographie/features/trips/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:riverpod/riverpod.dart";
import "package:vamos_cartographie/core/injection/client_provider.dart";

part 'trips_notifier.g.dart';

final tripRemoteDatasourceProvider = Provider<TripRemoteDatasource>((ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepository(ref.watch(tripRemoteDatasourceProvider));
});

@riverpod
class TripsNotifier extends _$TripsNotifier with EntityStore<Trip> {
  TripRepository get repo => ref.read(tripRepositoryProvider);
  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);

  Future<Map<int, Trip>> _load() async {
    final result = await repo.getAllTrips();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => {for (final trip in trips) trip.id: trip},
    );
  }

  @override
  Future<Map<int, Trip>> build() => _load();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }

  // --------------------------------------------------
  // CREATE
  // --------------------------------------------------

  Future<void> createTrip(TripDraft tripDraft) async {
    final result = await repo.createTrip(tripDraft);

    result.fold(
      (failure) => throw Exception(failure.message),
      (trip) => createLocal((_) => trip),
    );
  }

  // --------------------------------------------------
  // UPDATE
  // --------------------------------------------------

  Future<void> updateTrip(int id, TripDraft draft) async {
    final old = getOrThrow(id);

    await executor.run(
      onApply: () {
        patchLocal(id, (_) => draft.toTrip(id));
      },
      remote: () => repo.updateTrip(id, draft),
      onSuccess: (Trip serverTrip) {
        createLocal((_) => serverTrip); // ou commitLocal(serverTrip)
      },
      onError: () {
        patchLocal(id, (_) => old);
      },
    );
  }

  // --------------------------------------------------
  // DELETE
  // --------------------------------------------------

  Future<void> deleteTrip(int id) async {
    final old = getOrThrow(id);

    await executor.run(
      onApply: () {
        removeLocal(id);
      },
      remote: () => repo.deleteTrip(id),
      onSuccess: (_) {
        // rien ou commitDeleteLocal(id)
      },
      onError: () {
        createLocal((_) => old);
      },
    );
  }
}

@riverpod
Iterable<int> tripIds(Ref ref) {
  return ref.watch(
    tripsProvider.select(
      (asyncTrips) => (asyncTrips.value ?? const <int, Trip>{}).keys,
    ),
  );
}

@riverpod
Trip? trip(Ref ref, int id) {
  return ref.watch(tripsProvider.select((state) => state.value?[id]));
}
