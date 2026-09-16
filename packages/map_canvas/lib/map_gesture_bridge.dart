import 'package:flutter/widgets.dart';
import 'package:map_engine/domain/pointer_gesture_state.dart';
import 'package:map_engine/map_engine.dart';
import 'gesture_resolver_type.dart';

abstract interface class GestureSceneReader {
  ProjectedScene get scene;
}

class MapGestureBridge extends StatefulWidget {
  const MapGestureBridge({
    required this.sceneReader,
    required this.actionResolver,
    required this.panAllowed,
    required this.child,
    super.key,
  });

  final GestureSceneReader sceneReader;
  final GestureActionResolver actionResolver;
  final ValueNotifier<bool> panAllowed;
  final Widget child;

  @override
  State<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends State<MapGestureBridge> {
  PointerGestureState currentState = PointerGestureState(gesture: EmptyState());

  void _resolvePointerGesture(MapPointerEvent pointerEvent) {
    final resolution = pointerEvent.resolve(
      PointerEventsResolverContext(
        state: currentState,
        scene: widget.sceneReader.scene,
      ),
    );
    currentState = resolution.state;

    widget.panAllowed.value = switch (currentState.gesture) {
      Dragging(:final dragged) => dragged == null,
      _ => true,
    };

    widget.actionResolver.resolve(resolution.action);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) =>
          _resolvePointerGesture(MapPointerDown(event.localPosition)),
      onPointerMove: (event) =>
          _resolvePointerGesture(MapPointerMove(event.localPosition)),
      onPointerUp: (event) =>
          _resolvePointerGesture(MapPointerUp(event.localPosition)),
      child: widget.child,
    );
  }
}
