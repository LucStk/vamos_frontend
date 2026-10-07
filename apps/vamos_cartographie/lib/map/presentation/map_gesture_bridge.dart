// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '/map/camera/injection/camera_or_null.dart';
import '/map/camera/injection/map_camera_provider.dart';
import '/map/injection/map_gesture_handler.dart';
import '/map/injection/map_scene.dart';
import 'map_canvas_view.dart';
import 'package:flutter/gestures.dart';

bool isSecondaryClick(PointerDownEvent event) =>
    event.kind == PointerDeviceKind.mouse &&
    (event.buttons & kSecondaryMouseButton) != 0;

@Dependencies([CameraOrNull, mapCamera, mapScene, MapGestureHandlerNotifier])
class MapGestureBridge extends ConsumerWidget {
  final List<Widget> mapLayers;
  const MapGestureBridge({required this.mapLayers, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gestureHandler = ref.read(mapGestureHandlerProvider.notifier);
    @Dependencies([MapGestureHandlerNotifier])
    void resolve(PointerEventType type, PointerEvent event) {
      final offset = ScreenOffset(event.localPosition);
      gestureHandler.onPointerEvent(type, offset);
    }

    bool _secondaryPressed = false;

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) {
        if (isSecondaryClick(event)) {
          _secondaryPressed = true;

          final offset = ScreenOffset(event.localPosition);
          gestureHandler.onSecondaryClick(offset);
          return; // on n'alimente pas le resolver
        }
        resolve(PointerEventType.down, event);
      },
      onPointerMove: (event) {
        if (_secondaryPressed) return;
        resolve(PointerEventType.move, event);
      },
      onPointerUp: (event) {
        if (_secondaryPressed) {
          _secondaryPressed = false;
          return;
        }
        resolve(PointerEventType.up, event);
      },
      onPointerCancel: (event) => _secondaryPressed = false,
      child: MapCanvas(layers: mapLayers),
    );
  }
}
