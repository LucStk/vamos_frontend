import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/data/data.dart';
import 'package:vamos_cartographie/features/trips/data/providers/trips_providers.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/application/pipeline/graph_executor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/infrastructure/providers/topology_providers.dart';

part 'trip_handler.g.dart';

@riverpod
class TripHandler extends _$TripHandler {
  TripRepository get repo => ref.read(tripRepositoryProvider);

  OptimisticExecutor get executor => ref.read(optimisticExecutorProvider);

  @override
  Future<Map<Id<Trip>, Trip>> build() async {
    final result = await repo.getAllTrips();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => {for (final trip in trips) trip.id: trip},
    );
  }

  Trip? get(Id<Trip> id) {
    return state.value?[id];
  }

  void set(Trip trip) {
    final current = state.value;
    if (current != null) {
      state = AsyncData({...current, trip.id: trip});
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await repo.getAllTrips();

      return result.fold(
        (failure) => throw Exception(failure.message),
        (trips) => {for (final trip in trips) trip.id: trip},
      );
    });
  }

  Future<void> createTrip(TripDraft draft) async {
    final result = await repo.createTrip(draft);

    result.fold((f) => throw Exception(f.message), (trip) {
      final current = state.value ?? {};

      state = AsyncData({...current, trip.id: trip});
    });
  }

  Future<void> updateTrip(Id<Trip> id, TripDraft draft) async {
    final old = state.value?[id];
    if (old == null) return;

    await executor.run(
      onApply: () => set(draft.toTrip(id)),
      remote: () => repo.updateTrip(id, draft),
      onSuccess: (Trip serverTrip) => set(serverTrip),
      onError: () => set(old),
    );
  }

  Future<void> deleteTrip(Id<Trip> id) async {
    final current = state.value;
    if (current == null) return;
    final old = current[id];
    if (old == null) return;
    await executor.run(
      onApply: () {
        final copy = Map<Id<Trip>, Trip>.from(current);
        copy.remove(id);
        state = AsyncData(copy);
      },

      remote: () => repo.deleteTrip(id),

      onSuccess: (_) {},

      onError: () {
        final copy = Map<Id<Trip>, Trip>.from(state.value ?? {});
        copy[id] = old;
        state = AsyncData(copy);
      },
    );
  }
}
