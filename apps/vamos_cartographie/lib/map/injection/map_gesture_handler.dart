import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../camera/injection/map_camera_provider.dart';
import '../domain/map_mode_provider.dart';
import 'map_scene.dart';
part 'map_gesture_handler.g.dart';

/// State : `true` tant que la carte peut être pannée
/// (`false` pendant le drag d'un objet).
@Riverpod(keepAlive: true, dependencies: [])
class MapGestureHandlerNotifier extends _$MapGestureHandlerNotifier {
  late final PointerGestureResolver _resolver = PointerGestureResolver(
    hitTest: _hitTest,
  );
  late final PendingTapTimer _tapTimer = PendingTapTimer(
    onTimeout: _onTapTimeout,
  );

  @override
  bool build() {
    ref.onDispose(_tapTimer.dispose);
    return true;
  }

  /// Point d'entrée unique : events pointeur et expiration du timer.
  void onPointerEvent(PointerEventType event, ScreenOffset offset) {
    final gesture = _resolver.resolve(event, offset);

    // Resynchro AVANT le dispatch : l'état du resolver est final,
    // et les listeners déclenchés par le dispatch voient un panAllowed à jour.
    _syncTimer();
    _syncPanAllowed();

    if (gesture == null) return;
    ref.read(mapModeProvider.notifier).handleGesture(gesture, offset);
  }

  void _onTapTimeout(PendingTap pending) =>
      onPointerEvent(PointerEventType.tapTimeout, pending.offset);

  void _syncTimer() {
    switch (_resolver.state) {
      case final PendingTap pending:
        _tapTimer.update(pending);
      case _:
        _tapTimer.cancel();
    }
  }

  void _syncPanAllowed() {
    final allowed = switch (_resolver.state) {
      DraggingState(:final dragged) => dragged == null,
      _ => true,
    };
    if (allowed != state) state = allowed;
  }

  MapObject? _hitTest({required ScreenOffset offset, MapObject? exclude}) {
    final scene = ref.read(mapSceneProvider);
    final camera = ref.read(mapCameraProvider);
    return scene.hitTest(
      camera.screenToWorld(offset),
      camera.zoomScale,
      ignore: (o) => exclude != null && o.isSameAs(exclude),
    );
  }
}
