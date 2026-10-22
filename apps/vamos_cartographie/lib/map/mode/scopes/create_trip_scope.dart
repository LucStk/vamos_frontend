part of '../mode_scope.dart';

@Riverpod(keepAlive: true, dependencies: [mapCamera, cameraDirector, mapMode])
TripCreateScope tripCreateScope(Ref ref) {
  final mode = ref.watch(mapModeProvider);

  if (mode is! CreateTripMode) {
    throw StateError('TripCreateScope nécessite le mode CreateTripMode');
  }

  return _TripCreateScope(
    ref: ref,
    director: ref.watch(cameraDirectorProvider),
    camera: ref.watch(mapCameraProvider),
    tripEditor: ref.watch(tripStoreProvider.notifier),
  );
}

final class _TripCreateScope implements TripCreateScope {
  const _TripCreateScope({
    required this.director,
    required this.camera,
    required this.tripEditor,
    required this.ref,
  });

  @override
  final CameraDirector director;

  @override
  final MapCameraController camera;

  @override
  final TripEditor tripEditor;

  final Ref ref;
}
