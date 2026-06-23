import 'package:media_application/media_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';

import "/core/injection/client_provider.dart";
import '/core/injection/media_store.dart';
import '/core/injection/optimistic_executor_provider.dart';
import '/core/injection/trip_store.dart';
import '/infrastructure/trip/trip_remote_datasource.dart';
import '/infrastructure/trip/trip_repository_impl.dart';
part 'trip_provider.g.dart';

@riverpod
TripRemoteDatasource tripRemoteDatasource(Ref ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TripRepository tripRepository(Ref ref) {
  return TripRepositoryImpl(ref.watch(tripRemoteDatasourceProvider));
}

@riverpod
TripHandler tripHandler(Ref ref) {
  final store = ref.watch(rawTripStoreProvider);
  final mediaStore = ref.watch(rawMediaStoreProvider);
  final repo = ref.watch(tripRepositoryProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  return TripHandler(store, mediaStore, repo, executor);
}

@riverpod
List<ImageUiModel> tripImages(Ref ref, TripId tripId) {
  // Réactif au trip (si ses images changent)
  final asyncTrips = ref.watch(tripStoreProvider);
  final trip = asyncTrips.value?[tripId];
  if (trip == null) return [];

  final projector = ref.watch(imageProjectorProvider);
  return trip.images.map((img) => projector.project(img.fileKey)).toList();
}
