import 'package:flutter/foundation.dart';
import 'package:map_canvas/pending_tap_timer.dart';
import 'package:map_engine/controller/application/application.dart';
import 'package:map_engine/controller/domain/domain.dart';
import 'package:map_engine/visual/domain/map_scene.dart';

class MapGestureHandler {
  MapGestureHandler({
    required this.gestureResolver,
    required this.actionResolver,
    required this.sceneReader,
    required this.panAllowed,
  });

  final PointerGestureResolver gestureResolver;
  final GestureActionHandler actionResolver;
  final GestureSceneReader sceneReader;
  final ValueNotifier<bool> panAllowed;

  PointerGestureState currentState = const PointerGestureState(
    gesture: EmptyState(),
  );

  late final PendingTapTimer _pendingTapTimer = PendingTapTimer(
    onTimeout: _resolvePendingTap,
  );

  void handle(MapPointerEvent event) {
    final element = sceneReader.scene.hitTest(event.offset, event.scale);

    final resolution = gestureResolver.resolve(
      event,
      element: element,
      state: currentState,
    );

    currentState = resolution.state;

    _pendingTapTimer.update(currentState.pendingTap);

    final gesture = resolution.gesture;
    if (gesture == null) {
      return;
    }

    final action = actionResolver.resolve(
      gesture,
      MapGestureActionContext(scene: sceneReader.scene),
    );

    if (action != null) {
      actionResolver.emit(action);
    }
  }

  void _resolvePendingTap() {
    final pendingTap = currentState.pendingTap;
    if (pendingTap == null) {
      return;
    }

    handle(
      MapPointerTapTimeout(offset: pendingTap.point, scale: pendingTap.scale),
    );
  }

  void dispose() {
    _pendingTapTimer.dispose();
  }
}
