part of '../mode_scope.dart';

@Riverpod(keepAlive: true, dependencies: [mapCamera, cameraDirector, mapMode])
TripEditScope tripEditScope(Ref ref) {
  final mode = ref.watch(mapModeProvider);

  if (mode is! TripMode) {
    throw StateError('tripEditScope nécessite le mode TripMode.');
  }

  final tripId = mode.tripId;

  return _TripEditScope(
    ref: ref,
    director: ref.watch(cameraDirectorProvider),
    camera: ref.watch(mapCameraProvider),
    tripId: tripId,
    routeEditor: ref.read(routeStoreProvider(tripId).notifier),
    waypointEditor: ref.read(waypointStoreProvider(tripId).notifier),
  );
}

final class _TripEditScope implements TripEditScope {
  const _TripEditScope({
    required this.director,
    required this.camera,
    required this.tripId,
    required this.routeEditor,
    required this.waypointEditor,
    required this.ref,
  });
  @override
  RouteFields? getRoute(TripId tripId) =>
      ref.read(routeStoreProvider(tripId).select((s) => s.route?.current));
  @override
  final CameraDirector director;

  @override
  final MapCameraController camera;

  @override
  final TripId tripId;

  @override
  final RouteEditor routeEditor;

  @override
  final WaypointEditor waypointEditor;

  final Ref ref;

  @override
  RouteSectionFields? section(SectionId section) => ref
      .read(routeStoreProvider(tripId))
      .sectionStore
      .get(section) // à adapter à l'API de GraphCollectionStore
      ?.current;
}
