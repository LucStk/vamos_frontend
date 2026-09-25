import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/map/engine/camera/camera.dart';
part 'map_camera_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
MapController mapController(Ref ref) =>
    throw StateError('mapControllerProvider doit être fourni par un MapScope');

@Riverpod(keepAlive: true, dependencies: [mapController])
class MapCameraHolder extends _$MapCameraHolder {
  @override
  MapCameraController build() {
    return FlutterMapCamera(ref.watch(mapControllerProvider));
  }

  void attachAnimatedController(AnimatedMapController controller) {
    (state as FlutterMapCamera).attachAnimatedController(controller);
  }

  void detachAnimatedController() {
    (state as FlutterMapCamera).detachAnimatedController();
  }
}

@Riverpod(dependencies: [mapController])
class MapCameraChanges extends _$MapCameraChanges {
  @override
  int build() {
    final controller = ref.watch(mapControllerProvider);
    final subscription = controller.mapEventStream.listen((_) => state++);
    ref.onDispose(subscription.cancel);
    return 0;
  }
}

typedef CameraSnapshot = ({
  double zoomScale,
  double rotationRad,
  WorldOffset worldCenter,
  ScreenOffset screenCenter,
  Size size,
});

@Riverpod(dependencies: [MapCameraChanges, MapCameraHolder])
CameraSnapshot mapCameraSnapshot(Ref ref) {
  ref.watch(mapCameraChangesProvider);
  final c = ref.watch(mapCameraHolderProvider);
  return (
    zoomScale: c.zoomScale,
    rotationRad: c.rotationRad,
    worldCenter: c.worldCenter,
    screenCenter: c.screenCenter,
    size: c.size,
  );
}
