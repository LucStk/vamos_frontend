import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:media_application/runtime/observables/observable_media_store.dart';
import 'package:trip_application/topology/runtime/runtime.dart';
import 'package:trip_application/trip/domain/trip.dart';
import 'package:trip_application/trip/domain/trip_repository.dart';
import 'package:trip_application/trip_application.dart';

class TripQueryHandler {
  final GraphStore graphStore;
  final ObservableTripStore tripStore;
  final ObservableMediaStore mediaStore;
  final WaypointStore waypointStore;
  final TripRepository tripRepo;
  final OptimisticExecutor executor;

  TripQueryHandler({
    required this.graphStore,
    required this.tripStore,
    required this.waypointStore,
    required this.mediaStore,
    required this.tripRepo,
    required this.executor,
  });

  Future<Failure?> loadFromRemote() async {
    return executor
        .run(
          onApply: () {},
          remote: () => tripRepo.getAllTrips(),
          onSuccess: (data) {
            tripStore.clear();
            mediaStore.clear();
            for (final (trip, listImages) in data) {
              tripStore.upsert(trip);
              for (final i in listImages) {
                mediaStore.upsert(trip.id, i);
              }
            }
          },
          onError: (_) {},
        )
        .then((data) => data.fold((Failure f) => f, (data) => null));
  }

  Future<Failure?> loadTripDetails(TripId tripId) async {
    return executor
        .run(
          onApply: () {
            print("LoadTripDetails");
          },
          remote: () => tripRepo.getTripDetails(tripId),
          onSuccess: (data) {
            waypointStore.clear();
            graphStore.clear();
            graphPatchStore.clear();

            for (final (w, listImages) in data.waypoints_images) {
              waypointStore.upsert(w);
              for (final i in listImages) {
                mediaStore.upsert(w.id, i);
              }
            }
            for (final v in data.vertices) {
              graphStore.insertVertex(v);
            }
            for (final s in data.segments) {
              graphStore.insertSegment(s);
            }
          },
          onError: (Failure failure) {},
        )
        .then((data) => data.fold((Failure f) => f, (data) => null));
  }
}
