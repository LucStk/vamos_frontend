import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../camera/injection/map_camera_provider.dart';
import 'map_mode.dart';
import 'map_scene.dart';

/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).
part 'map_gesture_handler.g.dart';

/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).
@Riverpod(
  keepAlive: true,
  dependencies: [mapScene, mapCamera, mapModeController],
)
class MapGestureHandlerNotifier extends _$MapGestureHandlerNotifier {
  late MapGestureHandler _handler;

  @override
  bool build() {
    _handler = MapGestureHandler(
      sink: () => ref.read(mapModeControllerProvider),
      hitTest: _hitTest,
      onPanAllowedChanged: (allowed) => state = allowed,
    );
    ref.onDispose(_handler.dispose);
    return true;
  }

  void onPointerEvent(PointerEventType event, ScreenOffset offset) =>
      _handler.onPointerEvent(event, offset);

  void onSecondaryClick(ScreenOffset offset) =>
      _handler.onSecondaryClick(offset);

  MapObject? _hitTest({required ScreenOffset offset, MapObject? exclude}) {
    final scene = ref.read(mapSceneProvider);
    final camera = ref.read(mapCameraProvider);
    return scene.hitTest(
      camera.screenToWorld(offset),
      camera.zoomScale,
      ignore: (o) => exclude != null && o.isSameAs(exclude),
    );
  }
}
