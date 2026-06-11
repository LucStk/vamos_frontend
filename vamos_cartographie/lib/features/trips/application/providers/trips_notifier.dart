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
  @override
  Map<int, TripNode> build() {
    _load();
    return {};
  }

  TripRepository get repo => ref.read(tripRepositoryProvider);
  OptimisticExecutor get executor => ref.read(
    optimisticExecutorProvider,
  ); // ─────────────────────────────────────────────
  // STATE ACCESS
  // ─────────────────────────────────────────────

  Map<int, TripNode> get _store => state;

  Trip? getTrip(int id) => _store[id]?.value;

  Trip getOrThrow(int id) {
    final trip = getTrip(id);
    if (trip == null) throw StateError('Trip $id not found');
    return trip;
  }

  Future<void> _load() async {
    final result = await repo.getAllTrips();

    result.fold((f) => throw Exception(f.message), (list) {
      final map = <int, TripNode>{};

      for (final t in list) {
        map[t.id] = TripNode(t);
      }

      state = map;
    });
  }

  // ─────────────────────────────────────────────
  // CREATE
  // ─────────────────────────────────────────────

  Future<void> createTrip(TripDraft draft) async {
    final result = await repo.createTrip(draft);

    result.fold((f) => throw Exception(f.message), (trip) {
      state = {...state, trip.id: TripNode(trip)};
    });
  }

  // ─────────────────────────────────────────────
  // UPDATE (optimistic)
  // ─────────────────────────────────────────────

  Future<void> updateTrip(int id, TripDraft draft) async {
    final node = state[id];
    if (node == null) return;

    final old = node.value;
    final newTrip = draft.toTrip(id);

    await executor.run(
      onApply: () {
        node.set(newTrip);
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

  // ─────────────────────────────────────────────
  // DELETE
  // ─────────────────────────────────────────────

  Future<void> deleteTrip(int id) async {
    final node = state[id];
    if (node == null) return;

    final old = node.value;

    await executor.run(
      onApply: () {
        final copy = Map<int, TripNode>.from(state);
        copy.remove(id);
        state = copy;
      },
      remote: () => repo.deleteTrip(id),
      onSuccess: (_) {},
      onError: () {
        state = {...state, id: TripNode(old)};
      },
    );
  }
}
