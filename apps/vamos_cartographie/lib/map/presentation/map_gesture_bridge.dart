// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/injection/map_gesture_handler_provider.dart';

import 'package:vamos_cartographie/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([CameraOrNull, mapScene, mapCamera])
class MapGestureBridge extends ConsumerStatefulWidget {
  final List<Widget> mapLayers;
  const MapGestureBridge({required this.mapLayers, super.key});

  @override
  ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends ConsumerState<MapGestureBridge> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    void resolve(PointerEventType type, PointerEvent event) {
      final offset = ScreenOffset(event.localPosition);
      ref.read(mapGestureHandlerProvider.notifier).onPointerEvent(type, offset);
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => resolve(PointerEventType.down, event),
      onPointerMove: (event) => resolve(PointerEventType.move, event),
      onPointerUp: (event) => resolve(PointerEventType.up, event),
      child: MapCanvas(layers: widget.mapLayers, panAllowed: _panAllowed),
    );
  }
}
