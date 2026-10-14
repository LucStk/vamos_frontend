// injection/app_scope.dart
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
part 'mode_scope.g.dart';

// mode/mode_scopes.dart
final class _ExploreScopeImpl implements ExploreScope {
  const _ExploreScopeImpl({
    required this.director,
    required this.camera,
    required this.tripLookup,
  });

  @override
  final CameraDirector director;

  @override
  final MapCameraController camera;

  final Trip? Function(TripId tripId) tripLookup;

  @override
  Trip? getTrip(TripId tripId) => tripLookup(tripId);
}

final class _TripEditScopeImpl implements TripEditScope {
  const _TripEditScopeImpl({
    required this.director,
    required this.camera,
    required this.tripId,
    required this.graphEditor,
    required this.waypointEditor,
  });
  @override
  final CameraDirector director;
  @override
  final MapCameraController camera;
  @override
  final TripId tripId;
  @override
  final GraphEditor graphEditor;
  @override
  final WaypointEditor waypointEditor;
}

@Riverpod(keepAlive: true, dependencies: [mapMode, mapCamera, cameraDirector])
HandlerRegistry handlerRegistry(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);
  final camera = ref.watch(mapCameraProvider);

  return HandlerRegistry(switch (ref.watch(mapModeProvider)) {
    TripMode(:final tripId) => _TripEditScopeImpl(
      director: director,
      camera: camera,
      tripId: tripId,
      graphEditor: ref.read(graphStoreProvider(tripId).notifier),
      waypointEditor: ref.read(waypointStoreProvider(tripId).notifier),
    ),
    ExploreMode() => _ExploreScopeImpl(
      director: director,
      camera: camera,
      tripLookup: (TripId tripId) => ref.read(tripProvider(tripId)),
    ),
  });
}
