import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/trips/data/data.dart";
import "package:vamos_cartographie/features/trips/domain/trip.dart";
part 'trips_notifier.g.dart';

@riverpod
class TripsNotifier extends _$TripsNotifier {
  TripRepository get repository => ref.read(tripRepositoryProvider);

  @override
  Future<List<Trip>> build() async {
    // On lit le provider généré privé (il a maintenant le suffixe Provider)
    return _loadTrips();
  }

  Future<List<Trip>> _loadTrips() async {
    final result = await repository.getAllTrips();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => trips,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return _loadTrips();
    });
  }

  Future<void> createTrip(TripDraft trip) async {
    final result = await repository.createTrip(trip);

    result.fold((failure) => throw Exception(failure.message), (createdTrip) {
      final current = state.value ?? [];
      state = AsyncData([createdTrip, ...current]);
    });
  }

  Future<void> updateTrip(int id, TripDraft tripdraft) async {
    final previous = state.value ?? [];

    debugPrint("Draft Trip : $tripdraft");
    // optimistic update
    state = AsyncData([
      for (final t in previous)
        if (t.id == id) tripdraft.toTrip(id) else t,
    ]);

    final result = await repository.updateTrip(id, tripdraft);

    result.fold(
      (_) {
        // rollback
        state = AsyncData(previous);
      },
      (serverTrip) {
        // sync avec vérité serveur
        debugPrint("updateTrip result image ${serverTrip.images}");
        state = AsyncData([
          for (final t in state.value ?? [])
            if (t.id == id) serverTrip else t,
        ]);
      },
    );
  }

  Future<void> deleteTrip(int id) async {
    final result = await repository.deleteTrip(id);

    result.fold((failure) => throw Exception(failure.message), (_) {
      final current = state.value ?? [];
      state = AsyncData(current.where((t) => t.id != id).toList());
    });
  }
}

@riverpod
Trip? trip(Ref ref, int tripId) {
  final trips = ref.watch(tripsProvider).value;

  if (trips == null) return null;

  return trips.where((t) => t.id == tripId).firstOrNull;
}
