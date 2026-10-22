part of '../mode_scope.dart';

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
  RouteFields? getRoute(TripId tripId) =>
      ref.read(routeStoreProvider(tripId).select((s) => s.route?.current));
}
