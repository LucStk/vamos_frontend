import 'package:flutter/cupertino.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/map/map.dart';
part 'map_camera_provider.g.dart';

@Riverpod(dependencies: [mapCamera])
class MapCameraChanges extends _$MapCameraChanges {
  @override
  int build() {
    final controller = ref.watch(mapCameraProvider).mapController;
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

@Riverpod(dependencies: [MapCameraChanges, mapCamera])
CameraSnapshot mapCameraSnapshot(Ref ref) {
  ref.watch(mapCameraChangesProvider);
  final c = ref.watch(mapCameraProvider);
  return (
    zoomScale: c.zoomScale,
    rotationRad: c.rotationRad,
    worldCenter: c.worldCenter,
    screenCenter: c.screenCenter,
    size: c.size,
  );
}
