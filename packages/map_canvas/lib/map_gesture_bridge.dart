import 'package:flutter/widgets.dart';
import 'package:map_engine/map_engine.dart';

class MapGestureBridge extends StatefulWidget {
  MapGestureBridge({
    required OnGesture onGesture,
    required HitTest hitTest,
    required this.panAllowed,
    required this.child,
    required this.mapCameraReader,
    super.key,
  }) : gestureHandler = MapGestureHandler(
         hitTest: hitTest,
         onGesture: onGesture,
       );

  final MapGestureHandler gestureHandler;
  final MapCameraReader mapCameraReader;
  final ValueNotifier<bool> panAllowed;
  final Widget child;

  @override
  State<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends State<MapGestureBridge> {
  void _resolve(PointerEventType type, PointerEvent event) {
    final offset = widget.mapCameraReader.screenToWorld(
      ScreenOffset(event.localPosition),
    );
    widget.gestureHandler.resolve(type, offset);
    widget.panAllowed.value = widget.gestureHandler.panAllowed;
  }

  @override
  void dispose() {
    widget.gestureHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) => _resolve(PointerEventType.down, event),
      onPointerMove: (event) => _resolve(PointerEventType.move, event),
      onPointerUp: (event) => _resolve(PointerEventType.up, event),
      child: widget.child,
    );
  }
}
