import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/media/providers/media_store.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/providers/trip_store.dart';

import '/core/injection/optimistic_executor_provider.dart';
part 'trip_handler.g.dart';

@riverpod
TripHandler tripHandler(Ref ref) {
  final store = ref.read(rawTripStoreProvider);
  final mediaStore = ref.read(rawMediaStoreProvider);
  final repo = ref.read(tripRepositoryProvider);
  final executor = ref.read(optimisticExecutorProvider);
  return TripHandler(store, mediaStore, repo, executor);
}

// core/injection/commands/trip_provider.dart

// // Déclenché une fois à l'ouverture de l'explorer
// @riverpod
// Future<void> loadTripContext(LoadTripContextRef ref, TripId tripId) async {
//   await Future.wait([
//     ref.watch(loadWaypointsProvider(tripId).future),
//     ref.watch(loadTopologyProvider(tripId).future),
//   ]);
// }
