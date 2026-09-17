import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:map_canvas/domain/gesture_resolver_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/pointer_events_resolver/pointer_tap_timeout.dart';

abstract interface class GestureSceneReader {
  ProjectedScene get scene;
}

class MapGestureBridge extends StatefulWidget {
  const MapGestureBridge({
    required this.sceneReader,
    required this.actionResolver,
    required this.panAllowed,
    required this.child,
    required this.mapCameraReader,
    super.key,
  });

  final MapCameraReader mapCameraReader;
  final GestureSceneReader sceneReader;
  final GestureActionResolver actionResolver;
  final ValueNotifier<bool> panAllowed;
  final Widget child;

  @override
  State<MapGestureBridge> createState() => _MapGestureBridgeState();
}

class _MapGestureBridgeState extends State<MapGestureBridge> {
  static const double doubleTapTimeoutMs = 300;

  PointerGestureState currentState = PointerGestureState(gesture: EmptyState());

  Timer? _pendingTapTimer;

  void _resolvePointerGesture(MapPointerEvent pointerEvent) {
    final previousPendingTap = currentState.pendingTap;

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

    _updatePendingTapTimer(previousPendingTap: previousPendingTap);
  }

  void _updatePendingTapTimer({required PendingTap? previousPendingTap}) {
    final pendingTap = currentState.pendingTap;

    // Aucun tap en attente.
    if (pendingTap == null) {
      _pendingTapTimer?.cancel();
      _pendingTapTimer = null;
      return;
    }

    // Un PendingTap existe déjà : on ne recrée pas le timer.
    if (previousPendingTap != null) {
      return;
    }

    _pendingTapTimer?.cancel();

    _pendingTapTimer = Timer(
      Duration(milliseconds: doubleTapTimeoutMs.toInt()),
      _resolvePendingTap,
    );
  }

  void _resolvePendingTap() {
    _pendingTapTimer = null;

    if (currentState.pendingTap == null) {
      return;
    }

    _resolvePointerGesture(MapPointerTapTimeout());
  }

  @override
  void dispose() {
    _pendingTapTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,

      onPointerDown: (event) {
        final screenOffset = ScreenOffset(event.localPosition);
        final worldOffset = widget.mapCameraReader.screenToWorld(screenOffset);
        // final reconstruction = widget.mapCameraReader.worldToScreen(
        //   worldOffset,
        // );
        // print(
        //   "screenOffset ${screenOffset.value} reconstruction ${reconstruction.value}",
        // );
        _resolvePointerGesture(
          MapPointerDown(worldOffset, widget.mapCameraReader.getZoomScale()),
        );
      },

      onPointerMove: (event) => _resolvePointerGesture(
        MapPointerMove(
          widget.mapCameraReader.screenToWorld(
            ScreenOffset(event.localPosition),
          ),
          widget.mapCameraReader.getZoomScale(),
        ),
      ),

      onPointerUp: (event) => _resolvePointerGesture(
        MapPointerUp(
          widget.mapCameraReader.screenToWorld(
            ScreenOffset(event.localPosition),
          ),
          widget.mapCameraReader.getZoomScale(),
        ),
      ),

      child: widget.child,
    );
  }
}
