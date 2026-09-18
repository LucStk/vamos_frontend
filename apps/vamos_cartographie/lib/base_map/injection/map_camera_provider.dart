import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_camera_provider.g.dart';

@Riverpod(keepAlive: true)
MapController mapController(Ref ref) {
  final controller = MapController();
  ref.onDispose(controller.dispose);
  return controller;
}

@Riverpod(keepAlive: true)
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

/// Toujours utile si un widget doit se reconstruire quand la caméra bouge
/// (déplacement, zoom via geste utilisateur, etc.) — indépendant du fait
/// que l'animation soit attachée ou non.
@riverpod
class MapCameraChanges extends _$MapCameraChanges {
  @override
  int build() {
    final controller = ref.watch(mapControllerProvider);
    final subscription = controller.mapEventStream.listen((_) => state++);
    ref.onDispose(subscription.cancel);
    return 0;
  }
}
