import 'package:media_application/media_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/commands.dart/media_provider.dart';

import "/core/injection/client_provider.dart";
import '/core/injection/stores/media_store.dart';
import '/core/injection/optimistic_executor_provider.dart';
import '/core/injection/stores/trip_store.dart';
import '/infrastructure/trip/trip_remote_datasource.dart';
import '/infrastructure/trip/trip_repository_impl.dart';
part 'trip_provider.g.dart';

@riverpod
TripHandler tripHandler(Ref ref) {
  final store = ref.watch(rawTripStoreProvider);
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final repo = ref.watch(tripRepositoryProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  return TripHandler(store, mediaStore, repo, executor);
}
