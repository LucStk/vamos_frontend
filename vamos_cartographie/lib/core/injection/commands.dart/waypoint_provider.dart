import 'package:media_application/application/commands/media_handler.dart';
import 'package:media_application/application/services/media_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/core/injection/commands.dart/media_provider.dart';
import 'package:vamos_cartographie/core/injection/stores/media_store.dart';

import "/core/injection/client_provider.dart";
import '/core/injection/optimistic_executor_provider.dart';
import '/core/injection/stores/trip_store.dart';
import '/core/injection/stores/waypoint_store.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/waypoint_remote_datasource.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/waypoint_repository_impl.dart';
part 'waypoint_provider.g.dart';

@riverpod
WaypointRemoteDatasource waypointRemoteDatasource(Ref ref) {
  return WaypointRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
WaypointRepository waypointRepository(Ref ref) {
  return WaypointRepositoryImpl(ref.watch(waypointRemoteDatasourceProvider));
}

@riverpod
WaypointHandler waypointHandler(Ref ref, TripId tripId) {
  final store = ref.watch(rawWaypointStoreProvider);
  final repo = ref.watch(waypointRepositoryProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  return WaypointHandler(tripId, store, repo, executor);
}

@riverpod
MediaHandler waypointMediaHandler(Ref ref) {
  final patchStore = ref.watch(rawMediaPatchStoreProvider);
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  final mediaRepo = ref.watch(mediaRepositoryProvider);
  final waypointRepo = ref.watch(waypointRepositoryProvider);
  final mediaService = MediaServices(mediaRepo, waypointRepo, mediaStore);
  return MediaHandler(patchStore, executor, mediaService);
}
