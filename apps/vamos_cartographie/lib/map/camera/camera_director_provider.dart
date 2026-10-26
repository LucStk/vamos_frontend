import 'package:flutter_map/flutter_map.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';

part 'camera_director_provider.g.dart';

@Riverpod(keepAlive: true) //, dependencies: [mapCamera])
CameraDirector cameraDirector(Ref ref) {
  final camera = ref.watch(mapCameraProvider);
  final director = CameraDirector(camera: camera);

  final gestures = camera.mapController.mapEventStream
      .where((e) => _isUserGesture(e.source))
      .listen((_) => director.onUserGesture());

  ref.onDispose(() {
    gestures.cancel();
    director.dispose();
  });

  return director;
}

bool _isUserGesture(MapEventSource source) => switch (source) {
  MapEventSource.dragStart ||
  MapEventSource.onDrag ||
  MapEventSource.multiFingerGestureStart ||
  MapEventSource.onMultiFinger ||
  MapEventSource.scrollWheel ||
  MapEventSource.doubleTap ||
  MapEventSource.flingAnimationController => true,
  _ => false,
};
