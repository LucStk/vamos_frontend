import 'package:domain_core/notification/failure.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/application/application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/stored_file/stored_file.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';

part 'map_state_provider.g.dart';

@Riverpod(keepAlive: true)
class MapStateNotifier extends _$MapStateNotifier with MapEditor {
  @override
  MapMode get mode => state.mode;
  @override
  set mode(MapMode value) => state = state.copyWith(mode: value);

  @override
  MapElement get selection => state.selection;

  @override
  set selection(MapElement value) => state = state.copyWith(selection: value);

  @override
  GraphEditor get graphEditor => ref.read(graphStoreProvider(tripId).notifier);

  @override
  WaypointEditor get waypointEditor =>
      ref.read(waypointStoreProvider(tripId).notifier);

  // Plus de getter camera ici : `attachCamera()` (fourni par le mixin
  // MapEditor) est appelé une fois depuis le widget hôte, dans initState.

  @override
  MapEditorState build(TripId tripId) {
    Future.microtask(() => loadTripDetails());
    return const MapEditorState(mode: Idle(), selection: NoMapElement());
  }

  Future<Failure?> loadTripDetails() async {
    final tripRepo = ref.read(tripRepositoryProvider);
    final res = await tripRepo.getTripDetails(tripId);
    return res.fold((Failure f) => f, (data) {
      var newWaypointStore = WaypointStore.initial();
      var newGraphStore = GraphStore.initial();
      var newMediaStore = StoredFileStore.initial();
      for (final v in data.vertices) {
        newGraphStore = newGraphStore.insertVertex(v);
      }
      for (final s in data.segments) {
        newGraphStore = newGraphStore.insertSegment(s);
      }
      for (final (w, listImages) in data.waypointsImages) {
        newWaypointStore = newWaypointStore.insertWaypoint(w);
        for (final i in listImages) {
          newMediaStore = newMediaStore.insertStoredFile(w.id, i);
        }
      }
      final waypointStore = ref.read(waypointStoreProvider(tripId).notifier);
      waypointStore.state = newWaypointStore;
      final graphStore = ref.read(graphStoreProvider(tripId).notifier);
      graphStore.state = newGraphStore;
      final mediaStore = ref.read(storedFileStoreProvider.notifier);
      mediaStore.state = newMediaStore;
      return null;
    });
  }
}
