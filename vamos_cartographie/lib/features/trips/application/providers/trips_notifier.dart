import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/state/state.dart';
import "package:vamos_cartographie/features/trips/domain/trip.dart";
import 'package:vamos_cartographie/features/trips/data/trip_repository.dart';
import 'package:vamos_cartographie/features/trips/data/trip_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'trips_notifier.g.dart';

@riverpod
class TripsNotifier extends _$TripsNotifier with EntityNotifier<Trip> {
  TripRepository get repo => ref.read(tripRepositoryProvider);

  Future<Map<int, Trip>> _load() async {
    final result = await repo.getAllTrips();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => {for (final trip in trips) trip.id: trip},
    );
  }

  @override
  Future<Map<int, Trip>> build() async => _load();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _load());
  }

  Future<void> createTrip(TripDraft tripDraft) async {
    final result = await repo.createTrip(tripDraft);

    result.fold(
      (failure) => throw Exception(failure.message),
      (trip) => upsertLocal(trip),
    );
  }

  Future<void> updateTrip(int id, TripDraft draft) async {
    final old = getOrThrow(id);

    await optimistic(
      spec: OptimisticSpec(
        apply: () => updateLocal(draft.toTrip(id)),
        reconcile: upsertLocal,
        rollback: () => updateLocal(old),
      ),
      remote: () => repo.updateTrip(id, draft),
    );
  }

  Future<void> deleteTrip(int id) async {
    final old = getOrThrow(id);
    await optimistic(
      spec: OptimisticSpec(
        apply: () => removeLocal(id),
        rollback: () => upsertLocal(old),
      ),
      remote: () => repo.deleteTrip(id),
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

// @riverpod
// AsyncValue<Trip?> trip(Ref ref, int tripId) {
//   return ref.watch(
//     tripsProvider.select(
//       (asyncTrips) => asyncTrips.whenData((map) => map[tripId]),
//     ),
//   );
// }
@riverpod
Trip? trip(Ref ref, int id) {
  return ref.watch(tripsProvider.select((state) => state.value?[id]));
}
