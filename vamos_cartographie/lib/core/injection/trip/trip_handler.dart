import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/media/providers/media_store.dart';
import 'trip_store.dart';

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
