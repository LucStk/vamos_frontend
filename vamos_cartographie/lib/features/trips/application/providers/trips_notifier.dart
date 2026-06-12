import 'package:vamos_cartographie/features/graph/application/graph_providers.dart';
import 'package:vamos_cartographie/features/trips/application/trip_node.dart';
import 'package:vamos_cartographie/features/trips/data/data.dart';
import 'package:vamos_cartographie/features/trips/data/providers/trips_providers.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/graph/application/graph_executor.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trips_notifier.g.dart';

@riverpod
class TripsNotifier extends _$TripsNotifier {
  TripRepository get repo => ref.read(tripRepositoryProvider);

  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);

  @override
  Future<Map<int, TripNode>> build() async {
    final result = await repo.getAllTrips();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => {for (final trip in trips) trip.id: TripNode(trip)},
    );
  }

  Trip? getTrip(int id) {
    return state.value?[id]?.value;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await repo.getAllTrips();

      return result.fold(
        (failure) => throw Exception(failure.message),
        (trips) => {for (final trip in trips) trip.id: TripNode(trip)},
      );
    });
  }

  Future<void> createTrip(TripDraft draft) async {
    final result = await repo.createTrip(draft);

    result.fold((f) => throw Exception(f.message), (trip) {
      final current = state.value ?? {};

      state = AsyncData({...current, trip.id: TripNode(trip)});
    });
  }

  Future<void> updateTrip(int id, TripDraft draft) async {
    final node = state.value?[id];

    if (node == null) return;

    final old = node.value;
    final optimistic = draft.toTrip(id);

    await executor.run(
      onApply: () {
        node.set(optimistic);
      },

      remote: () => repo.updateTrip(id, draft),

      onSuccess: (Trip serverTrip) {
        node.set(serverTrip);
      },

      onError: () {
        node.set(old);
      },
    );
  }

  Future<void> deleteTrip(int id) async {
    final current = state.value;

    if (current == null) return;

    final node = current[id];

    if (node == null) return;

    final old = node.value;

    await executor.run(
      onApply: () {
        final copy = Map<int, TripNode>.from(current);

        copy.remove(id);

        state = AsyncData(copy);
      },

      remote: () => repo.deleteTrip(id),

      onSuccess: (_) {},

      onError: () {
        final copy = Map<int, TripNode>.from(state.value ?? {});

        copy[id] = TripNode(old);

        state = AsyncData(copy);
      },
    );
  }
}
