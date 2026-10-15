// injection/app_scope.dart
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
part 'mode_scope.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapCamera, cameraDirector])
ExploreScope exploreScope(Ref ref) {
  final director = ref.watch(cameraDirectorProvider);
  final camera = ref.watch(mapCameraProvider);

  return _ExploreScope(director: director, camera: camera, ref: ref);
}

final class _ExploreScope implements ExploreScope {
  const _ExploreScope({
    required this.director,
    required this.camera,
    required this.ref,
  });

  @override
  final CameraDirector director;

  @override
  final MapCameraController camera;

  final Ref ref;

  @override
  Trip? getTrip(TripId tripId) => ref.read(tripProvider(tripId));
}

@Riverpod(keepAlive: true, dependencies: [mapCamera, cameraDirector, mapMode])
TripEditScope tripEditScope(Ref ref) {
  final mode = ref.watch(mapModeProvider);

  if (mode is! TripMode) {
    throw StateError('tripEditScope nécessite le mode TripMode.');
  }

  final tripId = mode.tripId;

  return _TripEditScope(
    director: ref.watch(cameraDirectorProvider),
    camera: ref.watch(mapCameraProvider),
    tripId: tripId,
    graphEditor: ref.read(graphStoreProvider(tripId).notifier),
    waypointEditor: ref.read(waypointStoreProvider(tripId).notifier),
  );
}

final class _TripEditScope implements TripEditScope {
  const _TripEditScope({
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

@Riverpod(keepAlive: true, dependencies: [mapMode, exploreScope, tripEditScope])
HandlerRegistry handlerRegistry(Ref ref) {
  return HandlerRegistry(switch (ref.watch(mapModeProvider)) {
    ExploreMode() => ref.watch(exploreScopeProvider),
    TripMode() => ref.watch(tripEditScopeProvider),
  });
}
