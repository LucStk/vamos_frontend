// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '/map/camera/injection/camera_or_null.dart';
import '/map/camera/injection/map_camera_provider.dart';
import '/map/injection/map_gesture_handler.dart';
import '/map/injection/map_scene.dart';
import 'map_canvas_view.dart';
import '../canvas/injection/visual_target.dart';

@Dependencies([
  visualTargets,
  CameraOrNull,
  mapCamera,
  mapScene,
  MapGestureHandlerNotifier,
])
class MapGestureBridge extends ConsumerWidget {
  final List<Widget> mapLayers;
  const MapGestureBridge({required this.mapLayers, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handler = ref.read(mapGestureHandlerProvider.notifier);

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: handler.onPointerDown,
      onPointerMove: handler.onPointerMove,
      onPointerUp: handler.onPointerUp,
      onPointerCancel: handler.onPointerCancel,
      child: MapCanvas(layers: mapLayers),
    );
  }
}
