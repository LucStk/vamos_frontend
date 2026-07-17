import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/application/application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/waypoint/injection/injection.dart';
import 'trip_store.dart';
part 'trip_queries.g.dart';

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  return ref.watch(tripStoreProvider).tripStore.get(tripId);
}

@riverpod
Future<Failure?> loadTrips(Ref ref) async {
  final tripStore = ref.watch(tripStoreProvider);
  final tripRepo = ref.watch(tripRepositoryProvider);
  final mediaStore = ref.watch(storedFileStoreProvider);
  final res = await tripRepo.getAllTrips();
  res.fold(
    (Failure f) {
      return f;
    },
    (data) {
      tripStore.clear();
      for (final (trip, listImages) in data) {
        tripStore.insertTrip(trip);
        for (final i in listImages) {
          mediaStore.insertPatchMedia(trip.id, i);
        }
      }
    },
  );
  return null;
}

@riverpod
Future<Failure?> loadTripDetails(Ref ref, TripId tripId) async {
  final waypointStore = ref.watch(waypointStoreProvider(tripId));
  final graphStore = ref.watch(graphStoreProvider(tripId));
  final mediaStore = ref.watch(storedFileStoreProvider);
  final tripRepo = ref.watch(tripRepositoryProvider);
  final res = await tripRepo.getTripDetails(tripId);
  res.fold(
    (Failure f) {
      return f;
    },
    (data) {
      waypointStore.clear();
      graphStore.clear();

      for (final (w, listImages) in data.waypointsImages) {
        waypointStore.insertWaypoint(w);
        for (final i in listImages) {
          mediaStore.insertPatchMedia(w.id, i);
        }
      }
      for (final v in data.vertices) {
        graphStore.insertVertex(v);
      }
      for (final s in data.segments) {
        graphStore.insertSegment(s);
      }
      return null;
    },
  );
  return null;
}
