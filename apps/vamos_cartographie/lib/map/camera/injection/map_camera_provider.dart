import 'package:flutter/cupertino.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../application/flutter_map_camera.dart';
part 'map_camera_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
FlutterMapCamera mapCamera(Ref ref) =>
    throw StateError('mapCamera doit être fourni par un MapScope');

typedef CameraSnapshot = ({
  double zoomScale,
  double rotationRad,
  WorldOffset worldCenter,
  ScreenOffset screenCenter,
  Size size,
});

@Riverpod(keepAlive: true, dependencies: [mapCamera])
CameraSnapshot mapCameraSnapshot(Ref ref) {
  final camera = ref.watch(mapCameraProvider);

  final subscription = camera.mapController.mapEventStream.listen(
    (_) => ref.invalidateSelf(),
  );
  ref.onDispose(subscription.cancel);

  return (
    zoomScale: camera.zoomScale,
    rotationRad: camera.rotationRad,
    worldCenter: camera.worldCenter,
    screenCenter: camera.screenCenter,
    size: camera.size,
  );
}
