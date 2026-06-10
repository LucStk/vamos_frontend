import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/state/state.dart';
import "package:vamos_cartographie/features/trips/domain/trip.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/trips/application/services/trip_service.dart';
part 'trips_notifier.g.dart';

@riverpod
class TripsNotifier extends _$TripsNotifier with EntityNotifier<Trip> {
  TripService get service => ref.read(tripServiceProvider);

  @override
  Future<Map<int, Trip>> build() async => await service.getAllTrips();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await service.getAllTrips());
  }

  Future<void> createTrip(TripDraft tripDraft) async {
    final result = await service.createTrip(tripDraft);
    result.fold(
      (failure) => throw Exception(failure.message),
      (trip) => upsertLocal(trip),
    );
  }

  Future<void> updateTrip(int id, TripDraft draft) async {
    final old = getOrThrow(id);

    await optimistic(
      optimistic: () => updateLocal(draft.toTrip(id)),
      remote: () => service.updateTrip(id, draft),
      onSuccess: (server) => upsertLocal(server),
      rollback: () => updateLocal(old),
    );
  }

  Future<void> deleteTrip(int id) async {
    final old = getOrThrow(id);
    await optimistic(
      optimistic: () => removeLocal(id),
      remote: () => service.deleteTrip(id),
      onSuccess: (_) => removeLocal(id),
      rollback: () => upsertLocal(old),
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
AsyncValue<Trip?> trip(Ref ref, int tripId) {
  return ref.watch(
    tripsProvider.select(
      (asyncTrips) => asyncTrips.whenData((map) => map[tripId]),
    ),
  );
}
