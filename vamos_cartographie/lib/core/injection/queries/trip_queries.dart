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
part 'trip_queries.g.dart';

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  final asyncTrips = ref.watch(tripStoreProvider);
  return asyncTrips.value?[tripId];
}

@riverpod
List<ImageUiModel> tripImages(Ref ref, TripId id) {
  final mediaStore = ref.watch(mediaStoreProvider);
  final patchStore = ref.watch(mediaPatchStoreProvider);
  return [mediaStore]
}
