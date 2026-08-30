import 'dart:math';
import 'package:domain_core/notification/failure.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/application/application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import 'package:vamos_cartographie/stored_file/stored_file.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';

part 'map_state_provider.g.dart';

@Riverpod(keepAlive: true)
class MapStateNotifier extends _$MapStateNotifier with MapEditor {
  // Les getters/setters branchés sur le state Riverpod
  @override
  MapMode get mode => state.mode;
  @override
  set mode(MapMode value) => state = state.copyWith(mode: value);

  @override
  MapSelection get selection => state.selection;
  @override
  set selection(MapSelection value) => state = state.copyWith(selection: value);

  @override
  GraphEditor get graphEditor => ref.read(graphStoreProvider(tripId).notifier);
  @override
  WaypointEditor get waypointEditor =>
      ref.read(waypointStoreProvider(tripId).notifier);

  @override
  MapCameraController get camera => _RiverpodMapCameraController(ref);

  @override
  MapEditorState build(TripId tripId) {
    Future.microtask(() => loadTripDetails());
    return const MapEditorState(mode: Idle(), selection: NoSelection());
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

/// Seul point de contact Flutter pour le zoom — branché sur le
/// mapControllerProvider déjà overridé avec le vrai MapController
/// dans MapElementEngineWidget.
class _RiverpodMapCameraController implements MapCameraController {
  final Ref ref;
  _RiverpodMapCameraController(this.ref);

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final controller = ref.read(mapControllerProvider);
    final camera = controller.camera;
    final targetZoom = min(camera.zoom + deltaZoom, camera.maxZoom ?? 0);
    controller.move(latLng, targetZoom);
  }
}
