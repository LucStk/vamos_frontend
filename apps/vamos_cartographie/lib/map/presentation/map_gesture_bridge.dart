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

@Dependencies([CameraOrNull, mapCamera, mapScene, MapGestureHandlerNotifier])
class MapGestureBridge extends ConsumerWidget {
  final List<Widget> mapLayers;
  const MapGestureBridge({required this.mapLayers, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @Dependencies([MapGestureHandlerNotifier])
    void resolve(PointerEventType type, PointerEvent event) {
      final offset = ScreenOffset(event.localPosition);
      ref.read(mapGestureHandlerProvider.notifier).onPointerEvent(type, offset);
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => resolve(PointerEventType.down, event),
      onPointerMove: (event) => resolve(PointerEventType.move, event),
      onPointerUp: (event) => resolve(PointerEventType.up, event),
      child: MapCanvas(layers: mapLayers),
    );
  }
}
