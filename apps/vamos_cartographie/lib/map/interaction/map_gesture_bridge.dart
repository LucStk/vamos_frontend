// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/interaction/map_gesture_handler.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/scene/map_scene.dart';
import 'package:vamos_cartographie/map/rendering/map_canvas_view.dart';

import 'package:vamos_cartographie/map/interaction/visual_target.dart';

@Dependencies([visualTargets, MapGestureHandlerNotifier, mapCamera, mapScene])
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
