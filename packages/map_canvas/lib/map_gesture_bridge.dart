import 'package:flutter/widgets.dart';
import 'package:map_engine/map_engine.dart';

class MapGestureBridge extends StatefulWidget {
  const MapGestureBridge({
    required this.sceneReader,
    required this.gestureResolver,
    required this.actionResolver,
    required this.panAllowed,
    required this.child,
    required this.mapCameraReader,
    super.key,
  });

  final MapCameraReader mapCameraReader;
  final GestureSceneReader sceneReader;
  final PointerGestureResolver gestureResolver;
  final GestureActionHandler actionResolver;
  final ValueNotifier<bool> panAllowed;
  final Widget child;

  @override
  State<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends State<MapGestureBridge> {
  late final MapGestureHandler _gestureHandler = MapGestureHandler(
    gestureResolver: widget.gestureResolver,
    actionResolver: widget.actionResolver,
    sceneReader: widget.sceneReader,
    panAllowed: widget.panAllowed,
  );
  ({WorldOffset offset, double scale}) entry(PointerEvent event) => (
    offset: widget.mapCameraReader.screenToWorld(
      ScreenOffset(event.localPosition),
    ),
    scale: widget.mapCameraReader.getZoomScale(),
  );

  @override
  void dispose() {
    _gestureHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) =>
          _gestureHandler.handle(MapPointerDown(entry(event))),
      onPointerMove: (event) =>
          _gestureHandler.handle(MapPointerMove(entry(event))),
      onPointerUp: (event) =>
          _gestureHandler.handle(MapPointerUp(entry(event))),
      child: widget.child,
    );
  }
}
