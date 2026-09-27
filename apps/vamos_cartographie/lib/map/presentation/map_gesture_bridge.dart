// features/map/presentation/widgets/map_gesture_bridge.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([
  CameraOrNull,
  mapScene,
  mapController,
  mapGestureHandler,
  mapCamera,
])
class MapGestureBridge extends ConsumerStatefulWidget {
  final List<Widget> mapLayers;
  const MapGestureBridge({required this.mapLayers, super.key});

  @override
  ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends ConsumerState<MapGestureBridge> {
  final ValueNotifier<bool> _panAllowed = ValueNotifier(true);

  @override
  void dispose() {
    _panAllowed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapCamera = ref.read(mapCameraProvider);
    final gestureHandler = ref.read(mapGestureHandlerProvider);

    void resolve(PointerEventType type, PointerEvent event) {
      final offset = mapCamera.screenToWorld(ScreenOffset(event.localPosition));
      gestureHandler.resolve(type, offset);
      _panAllowed.value = gestureHandler.panAllowed;
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => resolve(PointerEventType.down, event),
      onPointerMove: (event) => resolve(PointerEventType.move, event),
      onPointerUp: (event) => resolve(PointerEventType.up, event),
      child: MapCanvas(
        layers: widget.mapLayers,
        panAllowed: _panAllowed,
      ), // ⬅️ passé directement
    );
  }
}
